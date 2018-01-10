require "spec_helper"
require "./lib/expression_evaluator"

RSpec.describe ExpressionEvaluator do
  describe "#evaluate" do
    subject { described_class.new }

    context "valid expressions" do
      it "adds" do
        expect(subject.evaluate("3 4 +"))
          .to eq 7
      end

      it "subtracts" do
        expect(subject.evaluate("3 4 -"))
          .to eq -1
      end

      it "multiplies" do
        expect(subject.evaluate("3 4 *"))
          .to eq 12
      end

      it "divides" do
        expect(subject.evaluate("6 3 /"))
          .to eq 2
      end

      it "multiple expression entries" do
        subject.evaluate("6 3 /")
        expect(subject.evaluate("3 *"))
          .to eq 6
      end
    end

    context "invalid expressions" do
      it "operand as only token" do
        expect{ subject.evaluate("*") }
          .to raise_error described_class::InvalidExpressionError
      end

      it "too many operands" do
        expect{ subject.evaluate("4 4 * +") }
          .to raise_error described_class::InvalidExpressionError
      end
    end
  end
end
