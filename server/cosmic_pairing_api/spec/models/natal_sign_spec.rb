require "rails_helper"

RSpec.describe NatalSign, type: :model do
  subject { build(:natal_sign) }

  it "returns valid natal sign" do
    expect(subject).to be_valid
  end

  describe "associations" do
    it { should belong_to(:natal_chart).class_name("NatalChart") }
    it { should belong_to(:celestial_sign).class_name("CelestialSign") }
  end
end
