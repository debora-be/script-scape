defmodule ScriptScape.HTTPClient do
  @moduledoc """
  This module is responsible for making HTTP requests.
  """

  @doc """
  Fetches data from the Techy API.
  """
  def get_techy_data do
    url = "#{techy_api()}/api/json"

    HTTPoison.get!(url)
  end

  @doc """
  Fetches an image from the Pexels API.
  """
  def get_pexels_image do
    headers = [{"Authorization", api_key()}]
    url = "#{pexels_api()}/v1/curated"

    HTTPoison.get!(url, headers)
  end

  defp api_key do
    Application.get_env(:script_scape, :http)[:pexels_api_key]
  end

  defp pexels_api do
    Application.get_env(:script_scape, :http)[:pexels_api]
  end

  defp techy_api do
    Application.get_env(:script_scape, :http)[:techy_api]
  end
end
