require 'rspec'

class StringCalculator
  
  def sum(string_of_numbers)
    validate_input(string_of_numbers)
    integers = extract_integers(string_of_numbers)
    check_for_negatives(integers)
    integers.reduce(0) { |sum, num| num <= 1000 ? sum + num : sum }
  end

  private

  # it validates that the input is a string
  def validate_input(input)
    raise 'Input must be a string' unless input.is_a?(String)
  end

  # Extracts integers from the string, supporting custom delimiters
  def extract_integers(string_of_numbers)
    string_of_numbers.split(/[^0-9-]+/).map(&:to_i)
  end

  # Checks for negative numbers and raises an exception if any are found
  def check_for_negatives(integers)
    negatives = integers.select { |num| num < 0 }
    raise "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end

# ------------------------------- TEST CASES -------------------------------------------------

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#sum' do
    context 'when input is valid' do
      it 'accepts a string without raising an error' do
        expect { calculator.sum('1,2,3') }.not_to raise_error
      end

      it 'returns 0 for an empty string' do
        expect(calculator.sum('')).to eq(0)
      end

      it 'returns the number itself when no delimiters are present' do
        expect(calculator.sum('678')).to eq(678)
      end

      it 'sums numbers separated by commas' do
        expect(calculator.sum('12,32')).to eq(44)
      end

      it 'sums numbers separated by newlines' do
        expect(calculator.sum("12\n24\n34")).to eq(70)
      end

      it 'handles custom delimiters' do
        expect(calculator.sum("//;;;;//\n1;9")).to eq(10)
      end

      it 'ignores numbers greater than 1000' do
        expect(calculator.sum("1009,2")).to eq(2)
      end
    end

    context 'when input is invalid' do
      it 'raises an error if the input is not a string' do
        expect { calculator.sum(777) }.to raise_error(RuntimeError, 'Input must be a string')
        expect { calculator.sum(['777']) }.to raise_error(RuntimeError, 'Input must be a string')
      end

      it 'does not accept negative numbers' do
        expect { calculator.sum("986,-5") }.to raise_error(RuntimeError, "Negatives not allowed: -5")
      end
    end
  end
end
