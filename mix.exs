defmodule Userfs.MixProject do

  use Mix.Project

  def project do
    [
      app: :userfs,
      version: "1.0.4",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, 'coveralls.html': :test],
    ]
  end

  def application do
    [
      mod: {Userfs.App, []},
      extra_applications: [:logger, :efuse],
    ]
  end

  defp deps do
    [
      {:efuse, git: "https://github.com/robertkeizer/erlang-efuse.git", branch: "master"},
      {:dialyxir, "~> 0.5.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.20.2", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.11.1", only: [:test], runtime: false},
      {:mock, "~> 0.3.3", only: [:test], runtime: false},
    ]
  end

  defp package() do
    [
      name:  "userfs",
      description: "Filesystem in USErspace (FUSE) for Elixir",
      licenses: ["MIT"],
      maintainers: [
        "Michael Wright <mjw@methodanalysis.com>"
      ],
      links: %{
        "Github" => "https://github.com/mwri/elixir-userfs",
      }
    ]
  end

  defp elixirc_paths(:test) do
    ["lib", "test/support"]
  end
  defp elixirc_paths(_) do
    ["lib"]
  end

end
