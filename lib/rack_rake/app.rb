require 'rack'
require_relative 'handler'
require_relative 'middleware'
require_relative 'view'

module RackRake
  class App
    class << self
      def app
        @app ||= Rack::Builder.new do
          use Rack::CommonLogger
          use Rack::ShowExceptions
          use Rack::Reloader
          use Rack::Lint

          use Middleware::RequestDebug

          map '/' do
            run ->(env) do
              if env['REQUEST_PATH'] == '/'
                [200, {'Content-Type' => 'text/plain'}, ['Homepage']]
              else
                [404, {'Content-Type' => 'text/plain'}, ['Not found']]
              end
            end
          end
        end
      end

      def route(pattern, &block)
        app.map(pattern) do
          run Handler.new(&block)
        end
      end
    end

    route('/foo') do
      View.new('hello-world').render
    end
  end
end
