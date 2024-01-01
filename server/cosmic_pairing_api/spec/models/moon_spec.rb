require 'rails_helper'

RSpec.describe Moon, type: :model do
  describe "validations" do
    subject { build(:moon) }

    it "validates the moon" do
      expect(subject).to be_valid
    end

    it "returns type as Moon" do
      expect(subject.type).to eq "Moon"
    end

    context "name" do
      it { should validate_presence_of(:name) }
      it { should_not allow_value("").for(:name) }
      it { should_not allow_value(nil).for(:name) }
    end
  end
end
