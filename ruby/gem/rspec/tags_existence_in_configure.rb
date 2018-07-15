RSpec.configure do |config|
  # RUN CASES
  # rspec this_script.rb --tag=some_tag
  if config.filter.rules[:some_tag]
    puts 'FOUND some_tag'

    config.before :example do
      puts 'BEFORE WHEN some_tag FOUND'
    end
  # RUN CASES
  # rspec this_script.rb
  # rspec this_script.rb --tag=another_tag
  # rspec this_script.rb --tag=~some_tag ( exclude some_tag )
  else
    puts 'NOT FOUND some_tag'

    config.before :example do
      puts 'BEFORE WHEN some_tag NOT FOUND'
    end
  end

  # When specify no tags
  # This before do not run in "RUN WHEN some_tag: true" describe
  config.before :example, some_tag: false do
    puts 'BEFORE WHEN some_tag FALSE'
  end
end

RSpec.describe do
  describe 'RUN WHEN some tag: true', some_tag: true do
    subject { true }
    it { is_expected.to be true }
  end

  describe 'RUN WHEN some_tag: false', some_tag: false do
    subject { true }
    it { is_expected.to be true }
  end
end
