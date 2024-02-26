defmodule ScriptScape.Models.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :content_searched, :string

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:content_searched])
    |> validate_required([:content_searched])
  end
end
