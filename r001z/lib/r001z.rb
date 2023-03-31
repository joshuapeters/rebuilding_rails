# frozen_string_literal: true

require_relative "r001z/version"

module R001z
  class App
    def call(env)
      [
        200,
        { "Content-Type" => "text/html" },
        ["Hello, from r001z!"]
      ]
    end  
  end
end
