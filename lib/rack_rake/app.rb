module RackRake
  class App
    def call(env)
      [200, {"Content-Type" => "text/html"}, ["Hello World from Rack App!"]]
    end
  end
end
