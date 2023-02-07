defmodule PushesWeb.WeatherChannel do
  use PushesWeb, :channel

  @impl true
  def join("weather:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
