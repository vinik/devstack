require 'chefspec'

at_exit { ChefSpec::Coverage.report! }

describe 'mydevstack::default' do
  let (:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs git' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('git')
  end

  it 'clones devstack repository' do
    chef_run.converge(described_recipe)
    expect(chef_run).to sync_git('/home/vagrant/devstack')
  end

end
