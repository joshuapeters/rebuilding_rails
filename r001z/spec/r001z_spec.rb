# frozen_string_literal: true

class TestController < R001z::Controller
  def action
    "test action"
  end
end

RSpec.describe R001z do
  it "has a version number" do
    expect(R001z::VERSION).not_to be nil
  end

  describe "controller tests" do
    it "test controller returns success" do
      env = {
        "PATH_INFO" => "/test/action",
        "QUERY_STRING" => "",
      }

      expect(200).to eq R001z::App.new.call(env).first
    end

    it "test controller returns text" do
      env = {
        "PATH_INFO" => "/test/action",
        "QUERY_STRING" => "",
      }

      expect("test action").to eq R001z::App.new.call(env).last.last
    end
  end

  describe "to_underscore" do
    it "converts camelcase to underscore" do
      expect("test_controller").to eq R001z.to_underscore("TestController")
    end
  end
end
