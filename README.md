# GarstApp

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Environment Variables

### `.env` file

It is recommended to hold a `.env` file in your working directory to configure the server for
development. An example `.env` file may contain the following lines of shell code to set up
environment variables.

```shell
# Your Mailgun domain
export GA_MG_DOMAIN=mg.garstapp.com
# Your Mailgun API_KEY
export GA_MG_API_KEY=key-614c91321fbb22bb329f3066e458161a

# Your Twilio Account SID
export GA_TWILIO_ACCOUNT_SID=BF55cc277dac99096c1239102cd4160006
# Your Twilio auth token
export GA_TWILIO_AUTH_TOKEN=2078090060440e929188c2b5a5b7fa76
# The number in your Twilio acct you wish to send texts from
export GA_TWILIO_SEND_NUMBER=+15556667777

# This is the HTTP Basic Auth Header we can use to circumvent
# the Twilio signing process. Leaving this empty "" will disable this.
# So, in whatever dev environment we have, we may have POST Webhook to:
# https://@garstapp.com/hook/sms
export GA_TWILIO_HTTP_BASIC_AUTH=twilio:superhardpassword

```

## References

The developer of this repository refers to prior notes from https://github.com/ZombieHippie/phoenix-rumbl-tutorial

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
