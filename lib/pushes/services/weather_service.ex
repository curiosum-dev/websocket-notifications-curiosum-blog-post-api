defmodule Pushes.Services.WeatherService do
  def broadcast_weather do
    case get_current_weather() do
      {:ok, weather_data} ->
        PushesWeb.Endpoint.broadcast("weather:lobby", "current_weather", %{data: weather_data})

      _ ->
        :error
    end
  end

  def send_push do
    with {:ok, weather_data} <- get_current_weather(),
         push_message <- format_weather_message(weather_data),
         notification <-
           Pigeon.FCM.Notification.new({:topic, "weather"}, %{"body" => push_message}) do
      Pushes.FCM.push(notification)
    else
      _ -> :error
    end
  end

  defp get_current_weather do
    case ExOwm.get_current_weather([%{city: "Poznan"}], units: :metric, lang: :en) do
      [{:ok, weather_data}] -> {:ok, weather_data}
      _ -> :error
    end
  end

  defp format_weather_message(%{"weather" => [%{"id" => weather_code}]}) do
    cond do
      weather_code < 300 -> "Thunders... thunders everywhere!"
      weather_code < 500 -> "I'm going to be all wet :/"
      weather_code < 600 -> "I'm singing in the rain!"
      weather_code < 800 -> "Something's not right..."
      weather_code < 900 -> "Cloudy today."
    end
  end
end
