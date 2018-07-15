# Run example
# 
# rspec tags_spec.rb_spec.rb --tag=some_tag
# some_tag specified
#
# rspec tags_spec.rb_spec.rb
# some_tag does not exist

RSpec.configure do |config|
  if config.filter.rules[:some_tag]
    puts "some_tag specified"
  else
    puts "some_tag not specified"
  end

  # This config 
  # For example option --tag=~some_tag
  # When rspec with no tags, this configure will be not set
  config.before :example, :some_tag do
  end
end

RSpec.describe do
  # Run cases
  # rspec -fd rspec/tags_spec.rb.rb 
  # rspec -fd rspec/tags_spec.rb.rb --tag=some_tag 
  # Not run cases
  # rspec -fd rspec/tags_spec.rb.rb  --tag=~some_tag ( exclude some_tag )
  # rspec -fd rspec/tags_spec.rb.rb  --tag=another_tag
  describe 'some_tag: true', some_tag: true do
    subject { true }
    it { is_expected.to be true }
  end

  # Run cases
  # rspec -fd rspec/tags_spec.rb.rb 
  # rspec -fd rspec/tags_spec.rb.rb --tag=~some_tag  ( exclude some_tag )
  # Not run cases
  # rspec -fd rspec/tags_spec.rb.rb --tag=some_tag 
  # rspec -fd rspec/tags_spec.rb.rb --tag=another_tag
  describe 'some_tag: false', some_tag: false do
    subject { true }
    it { is_expected.to be true }
  end
end

