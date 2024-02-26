defmodule ScriptScapeWeb.TechyController do
  use ScriptScapeWeb, :controller

  def show(conn, _params) do
    case ScriptScape.Parser.extract_message() do
      {:ok, message} ->
        ScriptScape.SaveLogs.save_log(message)

        conn
        |> put_status(200)
        |> json(%{message: message})

      {:error, _reason} ->
        conn
        |> put_status(400)
        |> json(%{message: :retry})
    end
  end
end
