require "spec_helper"

describe Api::V1::UsersController do
  describe "#create" do
    it "renders an error if email param is missing" do
      post :create
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:errors]).to include("Email can't be blank")
    end

    it "renders an error if email is invalid" do
      post :create, email: "invalid"
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:errors]).to include("Email is invalid")
    end

    it "requires a password" do
      post :create, email: "test@example.com"
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:errors]).to include("Password can't be blank")
    end

    context "success" do
      it "creates a user" do
        expect {
          get :create, email: "test@example.com", password: "secret12345"
        }.to change { User.count }.by(1)
      end

      it "responds with created user info" do
        get :create, email: "test@example.com", password: "secret12345"
        body = JSON.parse(response.body).with_indifferent_access
        expect(body[:user][:email]).to eq("test@example.com")
      end

      it "responds with created user info" do
        get :create, email: "test@example.com", password: "secret12345"
        body = JSON.parse(response.body).with_indifferent_access
        expect(body[:user][:email]).to eq("test@example.com")
      end
    end
  end

  describe "#show" do
    it "responds with user info" do
      user = FactoryGirl.create :user
      get :show, id: user.id
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:user][:email]).to eq user.email
      expect(body[:user][:last_name]).to eq user.last_name
    end
  end
end