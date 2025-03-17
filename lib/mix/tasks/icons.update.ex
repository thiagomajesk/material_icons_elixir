defmodule Mix.Tasks.Icons.Update do
  use Mix.Task

  @shortdoc "Updates the icon set via download from github"

  @repository "material-design-icons"
  @cdn "https://codeload.github.com"

  require Logger

  @impl true
  def run(_args) do
    Application.ensure_all_started(:httpoison)

    url = "#{@cdn}/marella/#{@repository}/zip/refs/tags/v#{Mix.Tasks.Icons.vsn()}"
    tmp_dir = Path.join(System.tmp_dir!(), @repository)

    ensure_dir!(tmp_dir)

    Logger.info("Downloading the icons from #{url}")

    case HTTPoison.get!(url) do
      %{status_code: 200, body: contents} ->
        {:ok, _paths} = :zip.unzip(contents, cwd: to_charlist(tmp_dir))
        copy_svg_files_from!(tmp_dir)
        Logger.debug("Finished copying svg files to the assets directory")

      %{status_code: code} ->
        Logger.error("Failed to download the icons from status code: #{code}")
    end
  end

  defp copy_svg_files_from!(tmp_dir) do
    base_dir = Path.join([tmp_dir, "#{@repository}-#{Mix.Tasks.Icons.vsn()}", "svg"])

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
