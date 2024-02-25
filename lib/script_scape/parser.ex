defmodule ScriptScape.Parser do
  @moduledoc """
  A parser for handling JSON responses.
  """

  @doc """
  Extracts the message from a JSON string.
  """
  @spec extract_message() :: {:ok, String.t()} | {:error, atom()}
  def extract_message do
    {:ok, %{body: body}} = ScriptScape.HTTPClient.get_techy_data()

    case Jason.decode(body) do
      {:ok, decoded} ->
        {:ok, decoded["message"]}

      {:error, _} ->
        {:error, :bad_request}
    end
  end
end
