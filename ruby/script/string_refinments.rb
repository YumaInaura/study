module MyRefineStringModule
  refine Integer do
    def to_s
      'overwrited by refinments'
    end
  end
end

class SomeClass
  using MyRefineStringModule
  
  puts 1.to_s # overwrited by refinements
end

puts 1.to_s # 1
