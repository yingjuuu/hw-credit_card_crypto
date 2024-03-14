# frozen_string_literal: true

# Module to validate credit card numbers using the credit card numbers using the Luhn algorithm.
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    # number = '5361002908876558'
    nums_a = @number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit

    # Remove the last digit (check digit) from the original number
    nums_without_check_digit = nums_a[0...-1]

    # Subtract 9 from doubled digits greater than 9
    doubled_digits = double(nums_without_check_digit).map { |digit| digit > 9 ? digit - 9 : digit }

    # Sum all the digits
    sum = doubled_digits.sum
    # puts sum

    # Calculate the checksum (last digit)
    checksum = (10 - (sum % 10)) % 10

    # Check if the calculated checksum matches the last digit / will return true or flase
    # checksum == nums_a.last
    given_check_digit = nums_a.last
    checksum == given_check_digit
  end

  def double(nums_without_check_digit)
    # Double every second digit, starting from the most right one / # each: use for side effect
    nums_without_check_digit.reverse.map.with_index do |digit, index|
      index.even? ? digit * 2 : digit # index.odd? ? digit * 2 : digit
    end
  end
end
