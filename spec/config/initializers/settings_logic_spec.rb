require_relative '../../spec_helper'

describe AppSettings do
  it "should retrieve app name" do
    AppSettings.app_name.should eq("AppName")
  end

  it "should not retrieve wrong app name" do
    AppSettings.app_name.should_not eq("AppName")
  end
end