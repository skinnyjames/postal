module Postal
  struct ParserOptions
    getter :internal
    
    def initialize(@internal : Libpostal::AddressParserOptions = Libpostal.libpostal_get_address_parser_default_options); end
    
    def language=(str : String)
      @internal.langauge = str
    end
    
    def country=(str : String)
      @internal.country = str
    end

    def language
      String.new(@internal.language)
    end

    def country
      String.new(@internal.country)
    end

    def to_unsafe
      @internal
    end
  end
end
