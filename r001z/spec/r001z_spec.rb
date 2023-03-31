# frozen_string_literal: true

RSpec.describe R001z do
  it "has a version number" do
    expect(R001z::VERSION).not_to be nil
  end

  it "test app returns success" do
    env = {
      "PATH_INFO" => "/",
      "QUERY_STRING" => "",
    }

    expect(200).to eq R001z::App.new.call(env).first
  end
end
