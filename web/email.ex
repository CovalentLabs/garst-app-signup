defmodule GarstApp.Email do
  use Bamboo.Phoenix, view: GarstApp.EmailView
  
  alias GarstApp.Account
  # @verify_sender { "Garst App Verify", "verify@garstapp.com" }
  def verify_email(account = %Account{}, verify_url) do
    verify_sender = { "Garst App Verifier", Application.get_env(:mailer, :send_verify_from) }

    campus = "Missouri State"
    phone = phone_fmt(account.phone)
    new_email()
    |> to(account)
    |> from(verify_sender)
    |> put_header("List-Unsubscribe", "<mailto:support@garstapp.com?subject=Unsubscribe>")
    # |> put_header("Reply-To", "garstapp-support@covalent.social")
    |> subject("Welcome, " <> account.nickname <> " to the Garst App Beta!")
    |> render(:verify, account: account, verify_url: verify_url, campus: campus)
  end

  def phone_fmt("+1" <> phone) do
    Regex.replace ~r/(\d{3})(\d{3})(\d{4})/, "8165160819", "(\\1) \\2-\\3"
  end

  defp notes do
    notes = ~w|
import Ecto.Query, only: [from: 2]
alias GarstApp.Repo
alias GarstApp.Account
acct = Repo.one! from a in Account, order_by: [ desc: a.inserted_at ], limit: 1
    |

  end
end

defimpl Bamboo.Formatter, for: GarstApp.Account do
  def format_email_address(account, _opts) do
    # IO.inspect account
    { account.nickname, account.email <> "@" <> account.email_domain }
  end
end