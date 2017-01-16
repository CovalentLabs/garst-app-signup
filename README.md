# GarstAppSignup

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Environment Variables

For **sending text messages**, we must specify the SMTP server credentials with

`TWILIO_ACCOUNT_SID`

`TWILIO_AUTH_TOKEN`


For **sending email**, we must specify the SMTP server credentials with

`GA_SMTP_DOMAIN`, Likely "smtp.mailgun.org" for mailgun.

`GA_SMTP_USERNAME`

`GA_SMTP_PASSWORD`

## References

The developer of this repository refers to prior notes from https://github.com/ZombieHippie/phoenix-rumbl-tutorial

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
