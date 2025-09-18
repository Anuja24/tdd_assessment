class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiters = [",", "\n"]

    # Check for custom delimiter
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)  # split into header + rest
      custom_delimiter = header[2]              # character after //
      delimiters = [custom_delimiter, "\n"]
    end

    pattern = Regexp.union(delimiters)
    numbers_array = numbers.split(pattern).map(&:to_i)
    numbers_array.sum
  end
end
