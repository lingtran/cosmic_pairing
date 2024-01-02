require "rails_helper"

RSpec.describe Celestial, type: :model do
  describe "validations" do
    subject { build(:celestial) }

    it "validates the celestial" do
      expect(subject).to be_valid
    end

    it "defaults type to Planet" do
      expect(subject.type).to eq "Planet"
    end

    context "name" do
      it { should validate_presence_of(:name) }
      it { should_not allow_value("").for(:name) }
      it { should_not allow_value(nil).for(:name) }
    end
  end
end
