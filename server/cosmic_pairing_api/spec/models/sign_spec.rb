require "rails_helper"

RSpec.describe Sign, type: :model do
  describe "validations" do
    subject { build(:sign) }

    it "validates the sign" do
      expect(subject).to be_valid
    end

    context "element" do
      it { should validate_presence_of(:element) }
      it { should define_enum_for(:element).with_values([:air, :earth, :fire, :water]) }
      it { should_not allow_value(nil).for(:element) }
    end

    context "modality" do
      it { should validate_presence_of(:modality) }
      it { should define_enum_for(:modality).with_values([:cardinal, :fixed, :mutable]) }
      it { should_not allow_value(nil).for(:modality) }
    end

    context "name" do
      it { should validate_presence_of(:name) }
      it { should_not allow_value("").for(:name) }
      it { should_not allow_value(nil).for(:name) }
    end

    context "#errors" do
      it "raises error for invalid element type" do
        invalid_element = "rust"
        expect { build(:sign, element: invalid_element) }
          .to raise_error(ArgumentError)
          .with_message("'#{invalid_element}' is not a valid element")
      end

      it "raises error for invalid modality type" do
        invalid_modality = "pliable"
        expect { build(:sign, modality: invalid_modality) }
          .to raise_error(ArgumentError)
          .with_message("'#{invalid_modality}' is not a valid modality")
      end
    end
  end

  describe "#get_all" do
    it "returns all elements" do
      create(:sign)
      result = Sign.get_all
      expect(result.length).to be 1
    end
  end
end
