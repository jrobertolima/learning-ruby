# spec/string_calculator_spec.rb
require "string_calculator"

describe StringCalculator do

  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
        expect(StringCalculator.add("")).to eql(0)
      end
    end

    context "given '4'" do
      it "returns 4" do
        expect(StringCalculator.add("4")).to eql(4)
      end
    end

    context "given two numbers" do
      context "given 4,-9" do
        it "returns -5" do
          expect(StringCalculator.add("4, -9")).to eql(-5)
        end
      end  

      context "given 100, 1000" do
        it "returns 1100" do
          expect(StringCalculator.add("100,1000")).to eql(1100)
        end
      end
    end

  end    
end
