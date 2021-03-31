require_relative 'view'

module RackRake
  class App
    def call(env)
      [200, {"Content-Type" => "text/html"}, [View.new('hello-world').render]]
    end
  end
end
