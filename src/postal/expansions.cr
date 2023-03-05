module Postal
  class Expansion
    def initialize(@value : String); end

    def to_s
      @value
    end

    def parsed(options : ParserOptions = ParserOptions.new)
      ParseResponse.new(Libpostal.libpostal_parse_address(@value.to_unsafe, options.to_unsafe).value).to_h
    end
  end

  class Expansions
    include Enumerable(Expansion)

    def initialize(@internal : LibC::Char**, @size : UInt64); end

    def each(& : (T ->))
      @internal.to_slice(@size).each do |char|
        yield Expansion.new(String.new(char))
      end
    end

    def finalize
      Libpostal.libpostal_expansion_array_destroy(@internal, size.to_u32)
    end
  end
end
