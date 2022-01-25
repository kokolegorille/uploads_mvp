defmodule UploadsMvp.Core.Event do
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset

  alias UploadsMvp.Uploaders.MediaUploader

  schema "events" do
    field :name, :string
    field :upload, MediaUploader.Type

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name])
    |> cast_attachments(attrs, [:upload])
    |> validate_required([:name, :upload])
  end
end
