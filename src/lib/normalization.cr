@[Link("postal")]
lib Libpostal
  struct Token
    offset : LibC::SizeT
    len : LibC::SizeT
    type : UInt16
  end

  struct NormalToken
    str : LibC::Char*
    token : Token
  end

  enum TokenTypes
    WORD 
  end

  fun libpostal_normalized_tokens(input : LibC::Char*, string_options : UInt64, token_options : UInt64, whitespace : Bool, n : LibC::SizeT*) : NormalToken*
end
