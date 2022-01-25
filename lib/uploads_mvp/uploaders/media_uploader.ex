defmodule UploadsMvp.Uploaders.MediaUploader do
  use Waffle.Definition
  use Waffle.Ecto.Definition

  @acl :public_read
  @versions [:original]

  def validate({_file, _}) do
    true
  end

  def storage_dir(version, {_file, nil}) do
    default_url(version, nil)
  end

  def storage_dir(version, {_file, scope}) do
    "medium/#{version}/#{scope.name}"
  end

  def filename(_version, {_file, nil}), do: nil
  def filename(_version, {file, scope}) do
    filename = file.file_name
      |> Path.basename(Path.extname(file.file_name))
      |> slugify()
      |> IO.inspect()

    "#{scope.name}_#{filename}"
  end

  defp slugify(filename), do: Slugger.slugify(filename)

  def default_url(version, _scope) do
    "/images/media/default_#{version}.png"
  end
end
