# frozen_string_literal: true

require 'test_helper'

class CalculateQuoteTest < ActiveSupport::TestCase
  test_expectations =
    [
      # Test all the boundaries
      OpenStruct.new(age: 18, trip_length: 0, quote_cents: 50_00),
      OpenStruct.new(age: 49, trip_length: 0, quote_cents: 50_00),
      OpenStruct.new(age: 50, trip_length: 0, quote_cents: 60_00),
      OpenStruct.new(age: 59, trip_length: 0, quote_cents: 60_00),
      OpenStruct.new(age: 60, trip_length: 0, quote_cents: 70_00),
      OpenStruct.new(age: 69, trip_length: 0, quote_cents: 70_00),

      OpenStruct.new(age: 18, trip_length: 7, quote_cents: 50_00),
      OpenStruct.new(age: 49, trip_length: 7, quote_cents: 50_00),
      OpenStruct.new(age: 50, trip_length: 7, quote_cents: 60_00),
      OpenStruct.new(age: 59, trip_length: 7, quote_cents: 60_00),
      OpenStruct.new(age: 60, trip_length: 7, quote_cents: 70_00),
      OpenStruct.new(age: 69, trip_length: 7, quote_cents: 70_00),

      OpenStruct.new(age: 18, trip_length: 8, quote_cents: 60_00),
      OpenStruct.new(age: 49, trip_length: 8, quote_cents: 60_00),
      OpenStruct.new(age: 50, trip_length: 8, quote_cents: 73_00),
      OpenStruct.new(age: 59, trip_length: 8, quote_cents: 73_00),
      OpenStruct.new(age: 60, trip_length: 8, quote_cents: 80_00),
      OpenStruct.new(age: 69, trip_length: 8, quote_cents: 80_00),

      OpenStruct.new(age: 18, trip_length: 14, quote_cents: 60_00),
      OpenStruct.new(age: 49, trip_length: 14, quote_cents: 60_00),
      OpenStruct.new(age: 50, trip_length: 14, quote_cents: 73_00),
      OpenStruct.new(age: 59, trip_length: 14, quote_cents: 73_00),
      OpenStruct.new(age: 60, trip_length: 14, quote_cents: 80_00),
      OpenStruct.new(age: 69, trip_length: 14, quote_cents: 80_00),

      OpenStruct.new(age: 18, trip_length: 15, quote_cents: 70_00),
      OpenStruct.new(age: 49, trip_length: 15, quote_cents: 70_00),
      OpenStruct.new(age: 50, trip_length: 15, quote_cents: 80_00),
      OpenStruct.new(age: 59, trip_length: 15, quote_cents: 80_00),
      OpenStruct.new(age: 60, trip_length: 15, quote_cents: 90_00),
      OpenStruct.new(age: 69, trip_length: 15, quote_cents: 90_00),

      OpenStruct.new(age: 18, trip_length: 21, quote_cents: 70_00),
      OpenStruct.new(age: 49, trip_length: 21, quote_cents: 70_00),
      OpenStruct.new(age: 50, trip_length: 21, quote_cents: 80_00),
      OpenStruct.new(age: 59, trip_length: 21, quote_cents: 80_00),
      OpenStruct.new(age: 60, trip_length: 21, quote_cents: 90_00),
      OpenStruct.new(age: 69, trip_length: 21, quote_cents: 90_00),

      OpenStruct.new(age: 18, trip_length: 22, quote_cents: 82_00),
      OpenStruct.new(age: 49, trip_length: 22, quote_cents: 82_00),
      OpenStruct.new(age: 50, trip_length: 22, quote_cents: 90_00),
      OpenStruct.new(age: 59, trip_length: 22, quote_cents: 90_00),
      OpenStruct.new(age: 60, trip_length: 22, quote_cents: 100_00),
      OpenStruct.new(age: 69, trip_length: 22, quote_cents: 100_00),

      # Plus some randoms
      OpenStruct.new(age: 19, trip_length: 5, quote_cents: 50_00),
      OpenStruct.new(age: 53, trip_length: 10, quote_cents: 73_00),
      OpenStruct.new(age: 62, trip_length: 17, quote_cents: 90_00),
      OpenStruct.new(age: 36, trip_length: 45, quote_cents: 82_00),
      OpenStruct.new(age: 54, trip_length: 18, quote_cents: 80_00),
      OpenStruct.new(age: 69, trip_length: 99, quote_cents: 100_00)
    ]

  test_expectations.each do |te|
    test "calculates the amount of the quote when age is #{te.age} and trip length is #{te.trip_length}" do
      result = CalculateQuote.call(quote: Quote.new(age: te.age, trip_length: te.trip_length, quote_currency: 'AUD'))
      assert_equal te.quote_cents, result.quote.quote_cents
    end
  end

  test 'rounds to the nearest whole day when the trip length is not an integer' do
    quote = CalculateQuote.call(quote: Quote.new(age: 18, trip_length: 7.5, quote_currency: 'AUD')).quote
    assert_equal 60_00, quote.quote_cents
  end

  test 'fails if the quote is not found' do
    result = CalculateQuote.call(quote: Quote.new(age: 0, trip_length: 0, quote_currency: 'AUD'))
    assert_equal 'No quote available for age 0, trip length 0.', result.error
  end
end
