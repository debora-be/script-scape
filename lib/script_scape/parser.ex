defmodule ScriptScape.Parser do
  @moduledoc """
  A parser for handling JSON responses.
  """

  @doc """
  Extracts the message from a JSON string.
  """
  def extract_message do
    %_{body: body} = ScriptScape.HTTPClient.get_techy_data()

    case Jason.decode(body) do
      {:ok, decoded} ->
        {:ok, decoded["message"]}

      {:error, _} ->
        {:error, :bad_request}
    end
  end

  @doc """
  Extracts an image URL from a JSON string.
  """
  def extract_image do
    %_{body: body} = ScriptScape.HTTPClient.get_pexels_image()

    {:ok, decoded} = Jason.decode(body)

    photos = decoded["photos"]

    case photos do
      [%{"src" => src} | _] ->
        {:ok, src["landscape"]}

      _ ->
        {:error, :not_found}
    end
  end
end
