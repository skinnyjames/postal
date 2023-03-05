require "./lib/*"
require "./postal/*"

module Postal
  alias Address = Libpostal::Address
  class Error < ::Exception; end

  def self.setup(datadir : String?)
    begin
      case datadir
      when .nil?
        raise_if_false(Libpostal.libpostal_setup, "Could not setup core library")
        raise_if_false(Libpostal.libpostal_setup_parser, "Could not setup parser")
        raise_if_false(Libpostal.libpostal_setup_language_classifier, "Could not setup language classifier")
      when String
        raise_if_false(Libpostal.libpostal_setup_datadir(datadir), "Could not setup core library at #{datadir}")
        raise_if_false(Libpostal.libpostal_setup_parser_datadir(datadir), "Could not setup parser at #{datadir}")
        raise_if_false(Libpostal.libpostal_setup_language_classifier_datadir(datadir), "Could not setup language classifier at #{datadir}")
      end
    rescue ex : Exception
      teardown
    end
  end
  
  def self.teardown
    Libpostal.libpostal_teardown_language_classifier
    Libpostal.libpostal_teardown_parser
    Libpostal.libpostal_teardown
  end

  private def self.raise_if_false(result : Bool, message : String)
    raise Error.new(message) unless result
  end

  class Worker
    def initialize(datadir : String? = nil)
      Postal.setup(datadir)
    end

    def parse(address : String, options : ParserOptions = ParserOptions.new)
      ParseResponse.new(Libpostal.libpostal_parse_address(address.to_unsafe, options.to_unsafe).value)
    end

    def expand(address : String, options : NormalizeOptions = NormalizeOptions.new)
      size = uninitialized LibC::SizeT

      Expansions.new(Libpostal.libpostal_expand_address(address.to_unsafe, options.to_unsafe, pointerof(size)), size: size)
    end

    def finalize
      Postal.teardown
    end
  end
end
