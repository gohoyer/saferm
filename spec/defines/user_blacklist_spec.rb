require 'spec_helper'
describe 'saferm::user_blacklist', :type => :define do
  context 'With all default parameters' do
    let(:title) { '/home/bob' }
    let(:params) { {:blacklist => ['/home/bob/','/bob_protected_dir'] }}
    it {
      should contain_file('/home/bob/.safe-rm')
    }
    it 'Should generate valid content for ~/.safe-rm' do
            content = catalogue.resource('file', '/home/bob/.safe-rm').send(:parameters)[:content]
            content.should match('/home/bob/')
            content.should match('/bob_protected_dir')
    end
  end
end
