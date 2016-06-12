require 'spec_helper'
describe 'saferm' do
  context 'with default values for all parameters' do
    it { should contain_class('saferm') }
  end
end
