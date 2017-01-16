defmodule GarstAppSignup.EmailView do
  use Bamboo.Phoenix, view: GarstAppSignup.EmailView

  def welcome_text_email(email_address) do
    new_email
    |> to(email_address)
    |> from("Garst App <hey@garstapp.com>")
    |> subject("Cole invited you to join the Garst App community!")
    |> html_body("""
<div style="max-width: 420px; margin: 0 auto; padding: 0 35px 25px 35px; color: #4A4A4A;">
  <div>
    <span style='font-size: 48px; font-weight: bold;'>Garst App</span>
    <br>
    <span style='font-size: 26px; font-weight: bold;'>Cole Lawrence has invited you to join the Garst App community!</span>
  </div>
  <div style="text-align: center; padding-top: 22px;">
    <a style="text-decoration: none; display: inline-block; min-width: 250px; padding-top: 19px; padding-bottom: 23px; background: #4FC3F7; border-radius: 5px; font-weight: bold; text-align: center; font-size: 26px; color: #4A4A4A;"
        href="https://garstapp.com/go/invitation/pojoihWAOUIPhgpowahop0wah">
      Sign up!
    </a>
  </div>
</div>
""")
  end
end