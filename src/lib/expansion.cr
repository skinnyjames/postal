@[Link("postal")]
lib Libpostal
  @[Flags]
  enum Address
    None = 0
    Any = (1 << 0)
    Name = (1 << 1)
    HouseNumber = (1 << 2)
    Street = (1 << 3)
    Unit = (1 << 4)
    Level = (1 << 5)
    Staircase = (1 << 6)
    Entrance = (1 << 7)
    Category = (1 << 8)
    Near = (1 << 9)
    Toponym = (1 << 13)
    PostalCode = (1 << 14)
    PoBox = (1 << 15)
    All = ((1 << 16) - 1)
  end

  struct NormalizeOptions
    languages : LibC::Char**
    num_languages : LibC::SizeT
    address_components : UInt16

    latin_ascii : Bool
    transliterate : Bool
    strip_accents : Bool
    decompose : Bool
    lowercase : Bool
    trim_string : Bool
    drop_parentheticals : Bool
    replace_numeric_hyphens : Bool
    delete_numeric_hyphens : Bool
    split_alpha_from_numeric : Bool
    replace_word_hyphens : Bool
    delete_word_hyphens : Bool
    delete_final_periods : Bool
    delete_acronym_periods : Bool
    drop_english_possessives : Bool
    delete_apostrophes : Bool
    expand_numex : Bool
    roman_numerals : Bool
  end

  fun libpostal_get_default_options : NormalizeOptions
  fun libpostal_expand_address(input : LibC::Char*, options : NormalizeOptions, n : LibC::SizeT*) : LibC::Char**
  fun libpostal_expand_address_root(input : LibC::Char*, options : NormalizeOptions, n : LibC::SizeT*) : LibC::Char**
  fun libpostal_expansion_array_destroy(expansions : LibC::Char**, n : LibC::SizeT)
end
