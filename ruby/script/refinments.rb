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

p SomeClass.name.first_5_characters # SomeC
