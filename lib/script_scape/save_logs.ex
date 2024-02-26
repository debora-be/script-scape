defmodule ScriptScape.SaveLogs do
  @doc """
  Saves a log to the database.
  """
  def save_log(message) do
    %ScriptScape.Models.Log{
      content_searched: message
    }
    |> ScriptScape.Models.Log.changeset(%{})
    |> ScriptScape.Repo.insert()
  end
end
