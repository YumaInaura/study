RSpec.describe do
  # Run cases
  # rspec -fd rspec/tags_spec.rb.rb 
  # rspec -fd rspec/tags_spec.rb.rb --tag=some_tag 
  # Not run cases
  # rspec -fd rspec/tags_spec.rb.rb  --tag=~some_tag ( exclude some_tag )
  # rspec -fd rspec/tags_spec.rb.rb  --tag=another_tag
  describe 'run when some_tag: true', some_tag: true do
    subject { true }
    it { is_expected.to be true }
    it { is_expected.to be true }
  end

  # Run cases
  # rspec -fd rspec/tags_spec.rb.rb 
  # rspec -fd rspec/tags_spec.rb.rb --tag=~some_tag  ( exclude some_tag )
  # Not run cases
  # rspec -fd rspec/tags_spec.rb.rb --tag=some_tag 
  # rspec -fd rspec/tags_spec.rb.rb --tag=another_tag
  describe 'run when some_tag: false', some_tag: false do
    subject { true }
    it { is_expected.to be true }
    it { is_expected.to be true }
  end
end

