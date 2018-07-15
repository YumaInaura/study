RSpec.configure do |config|
  # Run cases
  # rspec this_script.rb --tag=some_tag
  if config.filter.rules[:some_tag]
    puts 'some_tag SPECIFIED'
  # Run cases
  # rspec this_script.rb
  # rspec this_script.rb --tag=another_tag
  # rspec this_script.rb --tag=~some_tag ( exclude some_tag )
  else
    puts 'some_tag NOT SPECIFIED'
  end
end
