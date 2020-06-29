defmodule Cldr.Text do
  @moduledoc """
  Takes a list of results from a text
  classifier and attempts to identify a configured
  locale.

  """

  @max_languages 10

  def locale_from_text(string, options \\ []) do
    {_locale, backend} = Cldr.locale_and_backend_from(options)
    max_languages = Keyword.get(options, :max_languages, @max_languages)

    string
    |> Text.Language.classify(options)
    |> Enum.take(max_languages)
    |> classification_to_accept_language()
    |> Cldr.AcceptLanguage.best_match(backend)
  end

  def classification_to_accept_language([{_language, best_score} | _rest] = classification) do
    classification
    |> Enum.map(fn {language, score} -> "#{language};q=#{score / best_score}" end)
    |> Enum.join(",")
  end

end
