source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? ENV['PUPPET_VERSION'] : ['>= 3.3']
gem 'metadata-json-lint'
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>= 1.0.0'
gem 'puppet-lint', '>= 1.0.0'
gem 'puppet-lint-absolute_classname-check', '>=0.2.0'
gem 'puppet-lint-trailing_comma-check', '>=0.3.0'
gem 'puppet-lint-classes_and_types_beginning_with_digits-check', '>=0.1.0'
gem 'puppet-lint-version_comparison-check', '>=0.2.0'
gem 'puppet-lint-unquoted_string-check', '>=0.3.0'
gem 'facter', '>= 1.7.0'
gem 'rspec-puppet'
gem 'rspec-puppet-facts'

# rspec must be v2 for ruby 1.8.7
if RUBY_VERSION >= '1.8.7' && RUBY_VERSION < '1.9'
  gem 'rspec', '~> 2.0'
  gem 'rake', '~> 10.0'
else
  # rubocop requires ruby >= 1.9
  gem 'rubocop'
end
