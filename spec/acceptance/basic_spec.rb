require 'puppet-openstack_infra_spec_helper/spec_helper_acceptance'

describe 'puppet-haveged module' do
  def pp_path
    base_path = File.dirname(__FILE__)
    File.join(base_path, 'fixtures')
  end

  def default_puppet_module
    module_path = File.join(pp_path, 'default.pp')
    File.read(module_path)
  end

  it 'should work with no errors' do
    apply_manifest(default_puppet_module, catch_failures: true)
  end

  it 'should be idempotent' do
    apply_manifest(default_puppet_module, catch_changes: true)
  end

  describe package('haveged') do
    it { should be_installed }
  end

  describe service('haveged') do
    it { should be_enabled }
    it { should be_running }
  end
end
