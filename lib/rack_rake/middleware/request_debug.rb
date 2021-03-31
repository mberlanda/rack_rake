module RackRake
  module Middleware
    class RequestDebug
      def initialize(app)
        @app = app
      end

      def call(env)
        req = Rack::Request.new(env)
        puts req.inspect

        @app.call(env)
      end
    end
  end
end
