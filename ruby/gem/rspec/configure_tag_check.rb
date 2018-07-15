# Run example
# 
# rspec configure_tag_check_spec.rb --tag=some_tag
# some_tag exists
#
# rspec configure_tag_check_spec.rb
# some_tag does not exist

RSpec.configure do |config|
  if config.filter.rules[:some_tag]
    puts "some_tag exists"
  else
    puts "some_tag does not exist"
  end
end

RSpec.describe do
  subject { true }
  it { is_expected.to be true }
end
