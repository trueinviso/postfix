require "spec_helper"
require "./lib/standard_input_utility"

RSpec.describe StandardInputUtility do
  describe "#read" do
    context "valid expression" do
      it "prints result" do
        allow(STDIN).to receive(:gets).and_return("10 12 *", "q")
        expect { described_class.read }.to output(/120/).to_stdout
      end

      context "exiting program" do
        it "prints message" do
          allow(STDIN).to receive(:gets).and_return("q")
          expect { described_class.read }
            .to output(/Have a good day/).to_stdout
        end
      end
    end

    context "invalid operand" do
      it "prints error message" do
        allow(STDIN).to receive(:gets).and_return("1 1 * a")
        expect { described_class.read }
          .to output(/Invalid operand/).to_stdout
      end
    end

    context "invalid expression" do
      it "prints error message" do
        allow(STDIN).to receive(:gets).and_return("1 1 * +", "q")
        expect { described_class.read }
          .to output(/You have entered an invalid expression/).to_stdout
      end
    end
  end
end
