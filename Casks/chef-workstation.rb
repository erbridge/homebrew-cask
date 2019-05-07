cask 'chef-workstation' do
  ver = '0.2.53'
  rev = '1'

  version "#{ver}-#{rev}"
  sha256 '0a5ec7822f939a343c54d9f5b657ef438d765effc95683dd9e9df0d0821ddbc9'

  # packages.chef.io was verified as official when first introduced to the cask
  url "https://packages.chef.io/files/stable/chef-workstation/#{ver}/mac_os_x/10.14/chef-workstation-#{version}.dmg"
  name 'Chef Workstation'
  homepage 'https://www.chef.sh/'

  pkg "chef-workstation-#{version}.pkg"

  uninstall quit:    'sh.chef.chef-workstation',
            pkgutil: 'com.getchef.pkg.chef-workstation',
            delete:  '/Applications/Chef Workstation App.app',
            rmdir:   '/opt'

  caveats do
    path_environment_variable '/opt/chef-workstation/bin'
  end
end
