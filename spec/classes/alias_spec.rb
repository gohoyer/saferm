require 'spec_helper'
describe 'saferm::alias', :type => :class do
  context 'With all default parameters' do
    let(:facts) { {:osfamily => 'Debian'} }
    it {
      should contain_class('saferm::alias')
      should contain_file('/etc/profile.d/safe-rm.sh')
    }
  end
end
