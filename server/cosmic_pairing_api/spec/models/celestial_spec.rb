require 'rails_helper'

RSpec.describe Celestial, type: :model do
  describe "validations" do
    subject { build(:celestial) }

    it "validates the planet" do
      expect(subject).to be_valid
    end

    context "name" do
      it { should validate_presence_of(:name) }
      it { should_not allow_value("").for(:name) }
      it { should_not allow_value(nil).for(:name) }
    end
  end
end
