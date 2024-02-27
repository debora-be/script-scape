defmodule ScriptScape.Repo.Migrations.CreateLogsTable do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :content_searched, :string

      timestamps()
    end
  end
end
