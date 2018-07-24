module MyInteger
  refine Integer do
    def to_s
      'overwritten'
    end
  end
end


puts 1.to_s # 1

using MyInteger

puts 1.to_s # overwritten

