defmodule MyApp.Cldr do
  use Cldr,
    locales: ["en", "ja", "de"],
    default_locale: "en",
    providers: []
end