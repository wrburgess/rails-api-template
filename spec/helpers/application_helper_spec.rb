require "spec_helper"

describe ApplicationHelper, type: :helper do
  describe "#copyright_notice" do
    it "renders the current year in the Copyright notice" do
      current_year = Time.new.strftime "%Y"
      expect(copyright_notice).to eq "&copy; #{current_year} JBRB. All Rights Reserved"
    end
  end
end
