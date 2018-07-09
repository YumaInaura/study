module RefineStringModule
  refine String do
    def first_5_characters
      self[0..4]
    end
  end
end

class SomeClass
end

using RefineStringModule

puts '123456789'.first_5_characters # 12345
