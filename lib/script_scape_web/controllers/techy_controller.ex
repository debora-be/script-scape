defmodule ScriptScapeWeb.TechyController do
  use ScriptScapeWeb, :controller

  def show(conn, _params) do
    case ScriptScape.Parser.extract_message() do
      {:ok, message} ->
        conn
        |> json(%{message: message})
        |> put_status(200)

      {:error, _reason} ->
        conn
        |> json(%{message: :retry})
        |> put_status(400)
    end
  end
end
