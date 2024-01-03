require "rails_helper"

RSpec.describe NatalChart, type: :model do
  subject { build(:natal_chart) }

  it "returns valid natal chart" do
    expect(subject).to be_valid
  end

  describe "association" do
    it { should belong_to(:user).class_name("User") }
    it { should have_many(:natal_signs).class_name("NatalSigns") }
    it { should have_many(:celestial_signs).through(:natal_signs) }
  end
end
