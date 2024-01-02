require "rails_helper"

RSpec.describe Planet, type: :model do
  describe "validations" do
    subject { build(:planet) }

    it "validates the planet" do
      expect(subject).to be_valid
    end

    it "returns type as Planet" do
      expect(subject.type).to eq "Planet"
    end

    context "name" do
      it { should validate_presence_of(:name) }
      it { should_not allow_value("").for(:name) }
      it { should_not allow_value(nil).for(:name) }
    end
  end
end
