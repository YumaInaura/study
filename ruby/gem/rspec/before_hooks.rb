# https://relishapp.com/rspec/rspec-core/v/3-7/docs/hooks/before-and-after-hooks

RSpec.configure do |config|
  config.before :suite do
    puts 'before suite'
  end

  config.before :context do
    puts 'before context'
  end

  config.before :example do
    puts 'before example'
  end

  # Note: the :example and :context scopes are also available as :each and :all, respectively. Use whichever you prefer.

  # Same as context
  config.before :all do
    puts 'before all'
  end

  # Same as example
  config.before :each do
    puts 'before each'
  end
end

RSpec.describe do
  subject { true } 
 
  describe do
    it { is_expected.to be true }
    it { is_expected.to be true }
  end

  describe do
    it { is_expected.to be true }
    it { is_expected.to be true }
  end
end

