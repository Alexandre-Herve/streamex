defmodule Streamex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :streamex,
      name: "Streamex",
      source_url: "https://github.com/sixFingers/streamex",
      homepage_url: "http://sixfingers.github.io/streamex",
      version: "0.3.0",
      elixir: "~> 1.3",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger, :httpoison, :timex]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.3.1"},
      {:poison, "~> 2.2"},
      {:joken, "~> 1.2"},
      {:timex, "~> 3.4"},
      {:ex_doc, "~> 0.12", only: :dev},
      {:exvcr, "~> 0.10", only: :test},
      {:excoveralls, "~> 0.5", only: :test}
    ]
  end

  defp description do
    """
    A GetStream client for the Elixir language
    """
  end

  defp package do
    [
      name: :streamex,
      maintainers: ["Ignazio Setti"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/sixFingers/streamex",
        "Docs" => "http://sixfingers.github.io/streamex"
      }
    ]
  end
end
