source 'https://rubygems.org'

group :integration do
  gem 'berkshelf', '~> 3.2.3'
  gem 'test-kitchen', '~> 1.4.2'
  gem 'kitchen-vagrant', '~> 0.18.0'
end

group :test do
  gem 'chefspec', '~> 4.3.0'
  gem 'foodcritic', '~> 4.0'
  gem 'rake', '~> 10.1'
  gem 'rubocop', '~> 0.29.1'
end

group :chef_development do
  # Automatically run Tests upon file change
  gem 'guard', '~> 2.13.0'
  gem 'guard-rspec', '~> 4.6.4'

  gem 'guard-kitchen',
    git: 'git://github.com/logankoester/guard-kitchen.git',
    ref: 'master'
  gem 'guard-foodcritic', '~> 1.1.1'

  gem 'terminal-notifier-guard', '~> 1.6.4'
end

group :ruby_development do
  gem 'rails-erb-lint', '~> 1.1.1'
  gem 'guard-rubocop', '~> 1.2.0'
end
