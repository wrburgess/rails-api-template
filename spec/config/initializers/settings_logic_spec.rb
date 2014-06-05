require_relative "../../rails_helper"

describe AppSettings, type: :class do
  it "should retrieve app name" do
    expect(AppSettings.app_name).to eq("APP")
  end

  it "should not retrieve wrong app name" do
    expect(AppSettings.app_name).not_to eq("AppName")
  end
end