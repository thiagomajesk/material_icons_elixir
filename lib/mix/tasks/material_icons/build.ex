defmodule Mix.Tasks.MaterialIcons.Build do
  # Builds a new lib/material_icons.ex with bundled icon set.
  @moduledoc false
  @shortdoc false
  use Mix.Task

  @target_file "lib/material_icons.ex"

  def run(_args) do
    vsn = Mix.Tasks.MaterialIcons.Update.vsn()
    svgs_path = Mix.Tasks.MaterialIcons.Update.svgs_path()
    filled = Path.wildcard(Path.join(svgs_path, "filled/*.svg"))
    outlined = Path.wildcard(Path.join(svgs_path, "outlined/*.svg"))
    round = Path.wildcard(Path.join(svgs_path, "round/*.svg"))
    sharp = Path.wildcard(Path.join(svgs_path, "sharp/*.svg"))
    two_tone = Path.wildcard(Path.join(svgs_path, "tow-tone/*.svg"))
    ordered_icons = filled ++ outlined ++ round ++ sharp ++ two_tone

    icons =
      Enum.group_by(ordered_icons, &function_name(&1), fn file ->
        for path <- file |> File.read!() |> String.split("\n"),
            path = String.trim(path),
            String.starts_with?(path, "<path"),
            do: path
      end)

    Mix.Generator.copy_template("assets/material_icons.exs", @target_file, %{icons: icons, vsn: vsn},
      force: true
    )

    Mix.Task.run("format")
  end

  defp function_name(file) do
    file |> Path.basename() |> Path.rootname() |> String.split("-") |> Enum.join("_")
  end
end
