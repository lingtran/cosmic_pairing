require "rails_helper"

RSpec.describe NatalChart, type: :model do
  describe "association" do
    subject { build(:natal_chart) }
    it { should belong_to(:user).class_name("User") }

    it "returns valid natal chart" do
      expect(subject).to be_valid
    end
  end
end
