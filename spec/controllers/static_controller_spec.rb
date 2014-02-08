require "spec_helper"

describe StaticController do
  describe "#home" do
    it "renders the home template" do
      get :home
      # response.should render_template :home
      expect(response).to render_template "home"
    end

    it "renders application layout" do
      get :home
      # response.should render_template layout: "layouts/application"
      expect(response).to render_template layout: "layouts/application"
    end
  end
end
