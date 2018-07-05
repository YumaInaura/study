require 'retriable'

on_retry = Proc.new do |exception, try, elapsed_time, next_interval|
  puts "exception message : #{exception.message}"
  puts "try count: #{try}"
  puts "elapsed_time : #{elapsed_time}"
  puts "next_interval: #{next_interval}"
  puts
end

Retriable.retriable(on_retry: on_retry) do |info|
  raise
end

# Output Example

# excepti message :
# try count: 1
# elapsed_time : 9.6e-05
# next_interval: 0.5738686172216709

# exception message :
# try count: 2
# elapsed_time : 0.574546
# next_interval: 0.7523984849526505

# exception message :
# try count: 3
# elapsed_time : 1.331148
# next_interval:

# on_retry.rb:12:in `block in <main>': unhandled exception


