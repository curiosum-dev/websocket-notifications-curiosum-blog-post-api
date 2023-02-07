# Curiosum Websockets / Push Notifications Example

To start your Phoenix server:

  * Place your Google service account key (`service-account.json` file) in the project root directory.
  * Set OpenWeather API key as `OWM_API_KEY` env variable.
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Server will broadcast messages with a current weather in Poznań data to the `weather:lobby` channel every 2 minutes and send push notification to the FCM's `weather` topic every 5 minutes.

Enjoy!