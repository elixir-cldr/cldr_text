defmodule Cldr.Text.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :cldr_text,
      version: @version,
      elixir: "~> 1.8",
      name: "Cldr Text",
      source_url: "https://github.com/elixir-cldr/cldr_text",
      docs: docs(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore_warnings",
        plt_add_apps: ~w(inets jason mix)a
      ],
    ]
  end

  defp description do
    """
    Common Locale Data Repository (CLDR) functions for Elixir to derive
    a locale from natural language text.
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Kip Cole"],
      licenses: ["Apache 2.0"],
      links: links(),
      files: [
        "lib",
        "mix.exs",
        "README*",
        "CHANGELOG*",
        "LICENSE*"
      ]
    ]
  end

  def links do
    %{
      "GitHub" => "https://github.com/elixir-cldr/cldr_text",
      "Readme" => "https://github.com/elixir-cldr/cldr_text/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/elixir-cldr/cldr_text/blob/v#{@version}/CHANGELOG.md"
    }
  end

  def docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      logo: "logo.png",
      extras: [
        "README.md",
        "LICENSE.md",
        "CHANGELOG.md"
      ],
      skip_undefined_reference_warnings_on: ["changelog", "CHANGELOG.md"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_cldr, "~> 2.0"},
      {:text, "~> 0.2"},
      {:text_corpus_udhr, "~> 0.1"},
      {:jason, "~> 1.0"},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(:dev), do: ["lib", "mix", "bench"]
  defp elixirc_paths(_), do: ["lib"]
end
