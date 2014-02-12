require "spec_helper"

describe Api::V1::WidgetsController do

  describe "#index" do
    it "should return a list of widgets" do
      widget = FactoryGirl.create(:widget)
      get :index
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:widgets][0][:id]).to eq(widget.id)
    end

    it "returns an error message on failure" do
      expect { get :index }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "#show" do
    it "responds with the specified widget" do
      widget = FactoryGirl.create :widget
      get :show, id: widget.id
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:widget][:title]).to eq(widget.title)
    end

    it "returns an error message on failure" do
      expect { get :show, id: "oops" }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
