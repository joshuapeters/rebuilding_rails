# frozen_string_literal: true

require_relative "r001z/version"

require "erb"

module R001z

  class App
    def call(env)
      controller, action = controller_and_action(env)
      text = controller.new(env).send(action)
      [200, {"Content-Type" => "text/html"}, [text]]
    end

    def controller_and_action(env)
      _, controller, action, after = env["PATH_INFO"].split("/")
      controller = controller.capitalize + "Controller"
      [Object.const_get(controller), action]
    end
  end

  class Controller
    attr_reader :env
    
    def initialize(env)
      @env = env
    end

    def render(name, bind = binding())
      template = "app/views/#{name}.html.erb"
      erbTemplate = ERB.new(File.read(template))
      erbTemplate.result(bind)
    end

    def request
      @request ||= Rack::Request.new(@env)
    end

    def params
      request.params
    end
  end

  class Object
    def self.const_missing(c)
      require R001z.to_underscore(c.to_s)
      Object.const_get(c)
    end
  end

  def self.to_underscore(s)
    s.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
     .gsub(/([a-z\d])([A-Z])/,'\1_\2')
     .downcase
  end
end
