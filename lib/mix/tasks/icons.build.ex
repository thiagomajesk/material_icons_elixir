defmodule Mix.Tasks.Icons.Build do
  use Mix.Task

  @shortdoc "Compiles and bundles the icon set"

  @vsn Application.compile_env!(:material_icons, :version)
  @styles Application.compile_env!(:material_icons, :styles)

  def run(_args) do
    Application.ensure_all_started(:floki)

    icons =
      Enum.reduce(@styles, %{}, fn style, acc ->
        path = Path.join(["assets/icons", style, "*.svg"])

        Enum.reduce(Path.wildcard(path), acc, fn icon, acc ->
          put_in(acc, [Access.key(function_name(icon), %{}), style], extract_svg_paths(icon))
        end)
      end)

    Mix.Generator.copy_template(
      "assets/material_icons.exs",
      "lib/material_icons.ex",
      %{icons: icons, vsn: @vsn},
      force: true
    )

    Mix.Task.run("format", ["lib/material_icons.ex"])
  end

  defp extract_svg_paths(file) do
    file
    |> File.read!()
    |> Floki.parse_fragment!()
    |> Floki.find("svg > path")
    |> Floki.raw_html()
  end

  defp function_name(file) do
    file
    |> Path.basename()
    |> Path.rootname()
    |> String.split("-")
    |> Enum.join("_")
    |> maybe_append_underscore()
  end

  defp maybe_append_underscore(name) do
    if name =~ ~r/\d+\w+$/, do: "_#{name}", else: name
  end
end
