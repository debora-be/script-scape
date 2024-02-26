defmodule ScriptScapeWeb.PexelController do
  use ScriptScapeWeb, :controller

  @doc """
  Returns an image URL from the Pexels API.
  """
  def show(conn, _params) do
    case ScriptScape.Parser.extract_image() do
      {:ok, image_url} ->
        conn
        |> put_status(200)
        |> json(%{image_url: image_url})

      {:error, _reason} ->
        conn
        |> put_status(400)
        |> json(%{error: :retry})
    end
  end
end
