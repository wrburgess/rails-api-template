require "spec_helper"

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create :user).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build :user, email: nil).to_not be_valid
  end

  it { should have_many :widgets }
end
