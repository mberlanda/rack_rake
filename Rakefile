require 'rake'
require 'rack'

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'rack_rake'

namespace :rackup do
  desc 'Start rack server from application'
  task :app do
    Rack::Server.start(app: RackRake::App.new)
  end

  desc 'Start rack server from config file'
  task :config do
    Rack::Server.start(config: File.join(File.dirname(__FILE__), 'config.ru'))
  end
end
