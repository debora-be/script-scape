defmodule ScriptScapeWeb.PexelController do
  use ScriptScapeWeb, :controller

  @doc """
  Returns an image URL from the Pexels API.
  """
  def show(conn, _params) do
    case ScriptScape.Parser.extract_image() do
      image_url when is_binary(image_url) ->
        conn
        |> json(%{image_url: image_url})
        |> put_status(200)

      {:error, _reason} ->
        conn
        |> json(%{error: :retry})
        |> put_status(400)
    end
  end
end
