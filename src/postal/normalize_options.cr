module Postal
  struct NormalizeOptions
    delegate(
      latin_ascii,
      transliterate,
      strip_accents,
      decompose,
      lowercase,
      trim_string,
      drop_parentheticals,
      replace_numeric_hyphens,
      delete_numeric_hyphens,
      split_alpha_from_numeric,
      replace_word_hyphens,
      delete_word_hyphens,
      delete_final_periods,
      delete_acronym_periods,
      drop_english_possessives,
      delete_apostrophes,
      expand_numex,
      roman_numerals,
      to: @internal
    )

    def initialize(@internal : Libpostal::NormalizeOptions = Libpostal.libpostal_get_default_options); end

    def langauges=(arr : Array(String))
      langs = arr.map(&.to_unsafe)

      @internal.languages = pointerof(langs)
      @internal.num_languages = langs.size.to_u32
    end

    def address_components=(flag : Address)
      @internal.address_components = flag
    end

    def to_unsafe
      @internal
    end
  end
end
