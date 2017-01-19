defmodule GarstApp.JoinController do
  use GarstApp.Web, :controller

  alias GarstApp.Account
  alias GarstApp.VerifyCallback

  def new(conn, _params) do
    changeset = Account.changeset(%Account{})
    render conn, "new.html", changeset: changeset
  end

  # @token_length should be divisible by 3
  # as anything else will just have trailing =
  @token_length 24

  @text_line1 "Thank you for expressing interest in joining the Garst App beta program, "
  @text_line2 "Get started setting up a new account by following this link "
  def render_sms_verify(%Account{ nickname: nickname }, url) do
    @text_line1 <> nickname <> "!\n" <> @text_line2 <> url
  end

  def create(conn, %{ "account" => acct_params, "protocol_host" => protocol_host }) do
    IO.inspect acct_params
    changeset = Account.changeset(%Account{ password_hash: "undefined",
        email_domain: "live.missouristate.edu",
        mystery_name: "New User" }, acct_params)


    # send_resp(conn, 200, "We have received your application! Please accept the invitation in your email, and accept the invitation sent to your phone!")

    case Repo.insert(changeset) do
      {:ok, account} ->

        email_verifier = create_verifier! account, "email"
        phone_verifier = create_verifier! account, "phone"

        IO.inspect email_verifier

        # try do
        # rescue
        #   err ->
        #     IO.inspect err
        #     raise "Whoops"
        # end

        email_verify_url = verify_url protocol_host, email_verifier
        phone_verify_url = verify_url protocol_host, phone_verifier

        IO.inspect %{ email: email_verify_url, phone: phone_verify_url }

        # Send Email
        GarstApp.Email.verify_email(account, email_verify_url)
        |> GarstApp.Mailer.deliver_now()


        GarstApp.Texter.send_text_message(
          account.phone,
          render_sms_verify(account, phone_verify_url)
        )

        conn
        # |> Rumbl.Auth.login(account)
        |> put_flash(:info, "#{account.nickname}, we have received your application! Please accept the invitation in your email (#{account.email}), and accept the invitation sent to your phone (#{account.phone})!")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        IO.inspect changeset
        render conn, "new.html", changeset: changeset
    end
  end

  defp create_verifier!(account = %Account{}, type) do
    %VerifyCallback{
      account: account,
      type: type,
      token: create_token()
    }
    |> Repo.insert!()
  end

  defp verify_url(protocol_host, %{ token: email_token }) do
    verify_path = url_direction_path(GarstApp.Endpoint, :direct, "1", "verify", secret: email_token)
    protocol_host <> verify_path
  end

  defp create_token() do
    :crypto.strong_rand_bytes(@token_length)
    |> Base.url_encode64()
    # We could do substitutions here, but we no longer need
    # to since we are using Base.url_encode64/1
    # |> (&(Regex.replace @token_foreign_re, &1, @token_replace)).()
  end
end
