@[Link("postal")]
lib Libpostal
  fun libpostal_setup : Bool
  fun libpostal_setup_datadir(datadir : LibC::Char*) : Bool
  fun libpostal_setup_parser : Bool
  fun libpostal_setup_parser_datadir(datadir : LibC::Char*) : Bool
  fun libpostal_setup_language_classifier : Bool
  fun libpostal_setup_language_classifier_datadir(datadir : LibC::Char*) : Bool
  fun libpostal_teardown
  fun libpostal_teardown_parser
  fun libpostal_teardown_language_classifier
end
