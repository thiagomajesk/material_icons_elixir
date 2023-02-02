defmodule Mix.Tasks.Icons.Update do
  use Mix.Task

  @shortdoc "Updates the icon set via download from github"

  @cdn "https://codeload.github.com"

  require Logger

  @impl true
  def run(_args) do
    Application.ensure_all_started(:httpoison)

    url = "#{@cdn}/marella/material-design-icons/zip/refs/tags/v#{Mix.Tasks.Icons.vsn()}"
    tmp_dir = Path.join(System.tmp_dir!(), "material_icons")

    ensure_dir!(tmp_dir)

    with %{status_code: 200, body: contents} <- HTTPoison.get!(url),
         {:ok, _paths} <- :zip.unzip(contents, cwd: to_charlist(tmp_dir)),
         :ok <- copy_svg_files_from(tmp_dir) do
      Logger.debug("Finished copying svg files to the assets directory")
    end
  end

  defp copy_svg_files_from(tmp_dir) do
    base_dir = Path.join([tmp_dir, "material-design-icons-#{Mix.Tasks.Icons.vsn()}", "svg"])

    Enum.each(Mix.Tasks.Icons.styles(), fn style ->
      dest_dir = Path.join("assets/icons", style)

      ensure_dir!(dest_dir)

      File.cp_r!(Path.join(base_dir, style), dest_dir)
    end)
  end

  defp ensure_dir!(dir) do
    File.rm_rf!(dir)
    File.mkdir_p!(dir)
  end
end
