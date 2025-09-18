require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe "add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.new.add("")).to eq(0)
    end
    it "returns the number for a single number" do
      expect(StringCalculator.new.add("1")).to eq(1)
    end
    it "adds two numbers separated by comma" do
      expect(StringCalculator.new.add("1,5")).to eq(6)
    end
    it "adds any amount of numbers separated by comma" do
      expect(StringCalculator.new.add("1,2,3,4,5")).to eq(15)
    end
    it "handles newlines as separators in addition to commas" do
      expect(StringCalculator.new.add("1\n2,3")).to eq(6)
    end
    it "supports custom single-character delimiter" do
      expect(StringCalculator.new.add("//;\n1;2")).to eq(3)
    end
    it "raises an exception when there are negative numbers" do
      expect { StringCalculator.new.add("1,-2,3,-4") }.to raise_error(RuntimeError, "negative numbers not allowed -2,-4")
    end
  end
end
