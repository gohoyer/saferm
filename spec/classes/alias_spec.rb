require 'spec_helper'
describe 'saferm::alias', :type => :class do
  context 'With all default parameters' do
    let(:facts) { {:osfamily => 'Debian'} }
    it {
      should contain_class('saferm::alias')
      should contain_file('/etc/profile.d/safe-rm.sh')
    }
    it 'Should generate valid content for /etc/profile.d/safe-rm.sh' do
      content = catalogue.resource('file', '/etc/profile.d/safe-rm.sh').send(:parameters)[:content]
      content.should match('alias rm="/usr/bin/safe-rm"')
    end
  end
end
