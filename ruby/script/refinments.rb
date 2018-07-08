module RefineStringModule
  refine String do
    def first_5_characters
      self[0..4]
    end
  end
end

class SomeClass
end

# p SomeClass.name.first_5_characters # undefined method `first_5_characters' for "SomeClass":String (NoMethodError)

using RefineStringModule

p SomeClass.name.first_5_characters # SomeC
