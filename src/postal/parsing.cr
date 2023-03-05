module Postal
  class ParseResponse
    def initialize(@internal : Libpostal::AddressParserResponse); end

    def to_h
      comp_slice = @internal.components.to_slice(@internal.num_components)
      label_slice = @internal.labels.to_slice(@internal.num_components)

      label_slice.zip(comp_slice).to_h do |k, v|
        {String.new(k), String.new(v)}
      end
    end

    def finalize
      Libpostal.libpostal_address_parser_response_destroy(pointerof(@internal))
    end
  end
end
