require 'spec_helper'
describe 'openstack_role' do

  context 'with defaults for all parameters' do
    it { should contain_class('openstack_role') }
  end
end
