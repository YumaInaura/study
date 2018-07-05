require 'retriable'

Retriable.retriable do |info|
  p info
  raise
end

# 1
# 2
# 3
# example.rb:7:in `block in get': unhandled exception

