require "rails_helper"

RSpec.describe CelestialSign, type: :model do
  describe "validations" do
    subject { build(:celestial_sign) }

    it "validates the celestial sign" do
      expect(subject).to be_valid
    end

    context "essential dignity" do
      it { should define_enum_for(:essential_dignity).with_values([:domicile, :detriment, :exaltation, :fall]) }
      it { should_not allow_value(nil).for(:essential_dignity) }
    end

    context "#errors" do
      it "raises error for invalid essential dignity type" do
        invalid_dignity = "not right"
        expect { build(:celestial_sign, essential_dignity: invalid_dignity) }
          .to raise_error(ArgumentError)
          .with_message("'#{invalid_dignity}' is not a valid essential_dignity")
      end
    end
  end
end
