require "spec_helper"

describe Widget do

  it "has a valid factory" do
    expect(FactoryGirl.create :widget).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build :widget, title: nil).to_not be_valid
  end

  it { should belong_to :user }
end
