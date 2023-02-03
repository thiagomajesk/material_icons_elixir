defmodule MaterialIcons.MixProject do
  use Mix.Project

  def project do
    [
      app: :material_icons,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, "~> 0.18.11"},
      {:httpoison, "~> 2.0", only: [:dev, :test]},
      {:floki, "~> 0.34.0", only: [:dev, :test]}
    ]
  end
end
