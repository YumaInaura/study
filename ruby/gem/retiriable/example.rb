require 'retriable'

class Example
  def get
    Retriable.retriable do |info|
      p info
      raise
    end
  end
end

Example.new.get

# 1
# 2
# 3
# example.rb:7:in `block in get': unhandled exception

