# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

require 'capistrano/rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.1.3'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
