defmodule Mix.Tasks.Icons do
  use Mix.Task

  @shortdoc "Prints Material Icons help information"

  @default_vsn "0.14.2"
  @default_styles ~w(filled outlined round sharp two-tone)

  @vsn Application.compile_env(:material_icons, :version, @default_vsn)
  @styles Application.compile_env(:material_icons, :styles, @default_styles)

  @impl true
  @doc false
  def run(_args) do
    Mix.shell().info("Material Icons v#{Application.spec(:material_icons, :vsn)}")
    Mix.shell().info("Compiled icons v#{@vsn}")
    Mix.shell().info("\n## Options\n")
    Mix.Tasks.Help.run(["--search", "icons."])
  end

  def vsn(), do: @vsn
  def styles(), do: @styles
end
