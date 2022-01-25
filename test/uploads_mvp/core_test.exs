defmodule UploadsMvp.CoreTest do
  use UploadsMvp.DataCase

  alias UploadsMvp.Core

  describe "events" do
    alias UploadsMvp.Core.Event

    import UploadsMvp.CoreFixtures

    @invalid_attrs %{name: nil, upload: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Core.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Core.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{name: "some name", upload: "some upload"}

      assert {:ok, %Event{} = event} = Core.create_event(valid_attrs)
      assert event.name == "some name"
      assert event.upload == "some upload"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{name: "some updated name", upload: "some updated upload"}

      assert {:ok, %Event{} = event} = Core.update_event(event, update_attrs)
      assert event.name == "some updated name"
      assert event.upload == "some updated upload"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_event(event, @invalid_attrs)
      assert event == Core.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Core.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Core.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Core.change_event(event)
    end
  end
end
