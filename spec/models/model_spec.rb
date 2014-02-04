require 'spec_helper'

describe Model do

  it 'has a valid factory' do
    FactoryGirl.create(:model).should be_valid
  end

  it 'is invalid without a title' do
    FactoryGirl.build(:model, title: nil).should_not be_valid
  end

  # it { should belong_to :user }
  # it { should have_many :zones }

end