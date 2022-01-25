defmodule UploadsMvp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :upload, :string

      timestamps()
    end
  end
end
