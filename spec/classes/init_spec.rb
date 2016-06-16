require 'spec_helper'
describe 'saferm', :type => :class do
  context 'On Debian systems' do
    let(:facts) { {:osfamily => 'Debian'} }
    it {
      should contain_class('saferm')
      should contain_class('saferm::install')
      should contain_class('saferm::config')
      should contain_class('saferm::params')
      should contain_file('/etc/safe-rm.conf')
      should contain_package('safe-rm')
      should contain_anchor('saferm::start')
      should contain_anchor('saferm::end')
    }
  end
  context 'On RedHat systems with default values' do
    let(:facts) { {:osfamily => 'RedHat'} }
    it {
      should contain_class('saferm')
      should contain_class('saferm::install')
      should contain_class('saferm::config')
      should contain_class('saferm::params')
      should contain_anchor('saferm::start')
      should contain_anchor('saferm::end')
      should contain_exec('Download safe-rm').with({
        'command' => 'wget -q https://launchpad.net/safe-rm/trunk/0.12/+download/safe-rm-0.12.tar.gz -O /usr/src/safe-rm-0.12.tar.gz',
        'path'    => '/usr/bin',
        'creates' => '/usr/src/safe-rm-0.12.tar.gz',
      })
      should contain_exec('Uncompress safe-rm').with({
        'command' => 'tar -xzf /usr/src/safe-rm-0.12.tar.gz --strip-components=1 -C /usr/bin/ safe-rm-0.12/safe-rm',
        'path'    => '/bin/',
        'creates' => '/usr/bin/safe-rm'
      })
    }
  end
  context 'On Unsupported OS family' do
    let(:facts) { {:osfamily => 'Darwin'} }
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end
