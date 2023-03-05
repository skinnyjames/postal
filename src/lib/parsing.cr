@[Link("postal")]
lib Libpostal
  struct AddressParserOptions
    language : LibC::Char*
    country : LibC::Char*
  end

  struct AddressParserResponse
    num_components : LibC::SizeT
    components : LibC::Char**
    labels : LibC::Char**
  end

  fun libpostal_get_address_parser_default_options : AddressParserOptions
  fun libpostal_parse_address(address : LibC::Char*, options : AddressParserOptions) : AddressParserResponse*
  fun libpostal_address_parser_response_destroy(response : AddressParserResponse*)
end
