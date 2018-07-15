# https://relishapp.com/rspec/rspec-core/v/3-7/docs/hooks/before-and-after-hooks

RSpec.configure do |config|
  config.before :all do
    puts 'before all'
  end

  config.before :context do
    puts 'before context'
  end

  config.before :example do
    puts 'before example'
  end
end

RSpec.describe do
  subject { true } 
 
  context do
    it { is_expected.to be true }
  end

  describe do
    it { is_expected.to be true }
  end

  describe do
    it { is_expected.to be true }
  end
end

