require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    subject { build(:user) }

    it "validates the user" do
      expect(subject).to be_valid
    end

    context "username" do
      it { should validate_presence_of(:username) }
      it { should_not allow_value("").for(:username) }
      it { should_not allow_value(nil).for(:username) }
      it { should validate_uniqueness_of(:username) }
    end

    context "first_name" do
      it { should validate_presence_of(:first_name) }
      it { should_not allow_value("").for(:first_name) }
      it { should_not allow_value(nil).for(:first_name) }
    end
  end
end
