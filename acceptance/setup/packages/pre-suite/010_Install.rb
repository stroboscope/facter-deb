require 'puppet/acceptance/install_utils'
extend Puppet::Acceptance::InstallUtils
require 'beaker/dsl/install_utils'
extend Beaker::DSL::InstallUtils

test_name "Install Packages"

step "Install repositories on target machines..." do

  sha = ENV['SHA']
  repo_configs_dir = 'repo-configs'

  hosts.each do |host|
    install_repos_on(host, 'facter', sha, repo_configs_dir)
  end
end

PACKAGES = {
  :redhat => [
    'facter',
  ],
  :debian => [
    'facter',
  ],
#  :solaris => [
#    'puppet',
#  ],
#  :windows => [
#    'puppet',
#  ],
}

install_packages_on(hosts, PACKAGES)
