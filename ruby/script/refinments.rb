module RefineStringModule
  refine String do
    def first_5_characters
      self[0..4]
    end
  end
end

class SomeClass
  using RefineStringModule

  def self.some_method
    puts '123456789'.first_5_characters # 12345
  end
end

class OtherClass
  def self.some_method
     puts '123456789'.first_5_characters
  end
end

SomeClass.some_method

# OtherClass.some_method # `some_method': undefined method `first_5_characters' for "123456789":String (NoMethodError)

