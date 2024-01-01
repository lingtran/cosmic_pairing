require 'rails_helper'

RSpec.describe Sun, type: :model do
  describe "validations" do
    subject { build(:sun) }

    it "validates the sun" do
      expect(subject).to be_valid
    end

    it "returns type as Sun" do
      expect(subject.type).to eq "Sun"
    end

    context "name" do
      it { should validate_presence_of(:name) }
      it { should_not allow_value("").for(:name) }
      it { should_not allow_value(nil).for(:name) }
    end
  end
end
