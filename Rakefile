task :lint do
  require 'puppet-lint/tasks/puppet-lint'
  PuppetLint.configuration.send("disable_80chars")
  PuppetLint.configuration.ignore_paths = ["modules/puppetlabs-registry-master/**/*.pp"]
end

task :parse do
 require 'puppet-parse/puppet-parse'
end	
