defmodule UploadsMvp.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UploadsMvp.Core` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        name: "some name",
        upload: "some upload"
      })
      |> UploadsMvp.Core.create_event()

    event
  end
end
