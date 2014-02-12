require "spec_helper"

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create :user).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build :user, email: nil).to_not be_valid
  end

  it { should validate_presence_of :email }

  it { should have_many :widgets }

  describe "#sign_in" do
    context "valid user" do
      let(:user) { FactoryGirl.create :user }

      xit "should look up a user by email" do
        User.should_receive(:find_by).with(email: user.email)
        User.sign_in(user.email, user.password)
      end

      xit "signs in a user by email and password" do
        expect(User.sign_in(user.email, user.password)).to eq(user)
      end

      xit "returns :bad_password if password is not valid" do
        expect(User.sign_in(user.email, "incorrect")).to eq(:bad_password)
      end
    end

    context "invalid user" do
      before do
        user = FactoryGirl.create(:user)
      end

      xit "returns :user_not_found if no user matches email and password" do
        expect(User.sign_in("email", "password")).to eq(:user_not_found)
      end

      it "cannot be created with duplicate email addresses" do
        FactoryGirl.create :user, email: "tester@example.com"
        expect(FactoryGirl.build :user, email: "tester@example.com").to_not be_valid
      end
    end
  end
end
