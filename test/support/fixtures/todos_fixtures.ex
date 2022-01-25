defmodule UploadsMvp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UploadsMvp.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> UploadsMvp.Todos.create_todo()

    todo
  end
end
