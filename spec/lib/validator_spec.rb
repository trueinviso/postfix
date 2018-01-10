require "spec_helper"
require "./lib/validator"

RSpec.describe Validator do
  describe "#validate" do
    context "valid operands" do
      it "plus" do
        expect{ described_class.validate("+") }
          .to_not raise_error
      end

      it "minus" do
        expect{ described_class.validate("-") }
          .to_not raise_error
      end

      it "times" do
        expect{ described_class.validate("*") }
          .to_not raise_error
      end

      it "divide" do
        expect{ described_class.validate("/") }
          .to_not raise_error
      end
    end

    context "invalid operands" do
      it "character raises exception" do
        expect{ described_class.validate("a") }
          .to raise_error(Validator::IllegalArgumentException)
      end
    end
  end
end
