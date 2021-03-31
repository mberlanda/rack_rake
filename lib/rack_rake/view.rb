module RackRake
  class View
    READ_CACHE = {}

    def initialize(page, layout: 'layout')
      @layout = READ_CACHE[layout] ||= File.read(
        File.join(File.dirname(__FILE__), 'views', "#{layout}.html.erb")
      ).tap { puts "Reading #{layout}" }
      @page = READ_CACHE[page] ||= File.read(
        File.join(File.dirname(__FILE__), 'views', "#{page}.html.erb")
      ).tap { puts "Reading #{page}" }
    end

    def render
      @body = ERB.new(@page).result(binding)
      ERB.new(@layout).result(binding)
    end
  end
end
