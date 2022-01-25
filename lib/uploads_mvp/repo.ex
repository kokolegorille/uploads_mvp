defmodule UploadsMvp.Repo do
  use Ecto.Repo,
    otp_app: :uploads_mvp,
    adapter: Ecto.Adapters.Postgres
end
