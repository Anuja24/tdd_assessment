class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters, numbers = parse_delimiters(numbers)
    nums = numbers.split(Regexp.union(delimiters)).map(&:to_i)

    check_negatives(nums)
    nums.sum
  end

  private
  
  # Check for custom delimiter
  def parse_delimiters(numbers)
    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      delimiters << header[2] # support single custom delimiter
    end
    [delimiters, numbers]
  end
  
  # Check for negative numbers
  def check_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
  end
end

# uncomment the code to run the code
# cal = StringCalculator.new
# puts cal.add("1,2,4") # => 7


