defmodule ScriptScape.HTTPClient do
  @moduledoc """
  This module is responsible for making HTTP requests.
  """

  @api_base "https://techy-api.vercel.app"

  @doc """
  Fetches data from the Techy API.
  """
  @spec get_techy_data() :: {:ok, any()} | {:error, tuple()}
  def get_techy_data do
    url = "#{@api_base}/api/json"

    :inets.start()

    case :httpc.request(:get, {url, []}, [], []) do
      {:ok, response} ->
        {:ok, parse_response(response)}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp parse_response({status_line, headers, body}) do
    %{
      status_line: status_line,
      headers: headers,
      body: body
    }
  end
end
