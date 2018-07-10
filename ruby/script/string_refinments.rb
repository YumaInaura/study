module MyRefineStringModule
  refine Integer do
    def to_s
      'overwritten by refinments'
    end
  end
end

class SomeClass
  using MyRefineStringModule
  
  puts 1.to_s # overwritten by refinements

  def some_instance_method
    1.to_s
  end
  
  def self.some_class_method
    1.to_s
  end
end

puts SomeClass.new.some_instance_method # overwritten by refinments

puts SomeClass.some_class_method # overwritten by refinments

puts 1.to_s # 1
