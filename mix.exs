defmodule MaterialIcons.MixProject do
  use Mix.Project

  @version "0.2.0"
  @url "https://github.com/thiagomajesk/material_icons_elixir"

  def project do
    [
      app: :material_icons,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    """
    Material icons is a collection of icons designed by Google under the material design guidelines.
    This library provides optimized svgs for each icon packaged as a Phoenix Component and is heavily inspired by the heroicons_elixir project.
    """
  end

  defp package do
    [
      maintainers: ["Thiago Majesk Goulart", "Vinicius Müller"],
      licenses: ["AGPL-3.0-only"],
      links: %{"GitHub" => @url},
      files: ~w(lib mix.exs README.md LICENSE)
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      main: "README",
      canonical: "http://hexdocs.pm/material_icons",
      source_url: @url,
      extras: [
        "README.md": [filename: "README"]
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, ">= 0.18.0"},
      {:httpoison, "~> 2.0", only: [:dev, :test]},
      {:floki, "~> 0.37.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.37", only: :dev, runtime: false}
    ]
  end
end
