require 'test_helper'

class CalculateQuoteTest < ActiveSupport::TestCase
  test 'calculates the amount of the quote' do
    result = CalculateQuote.call(age: 60, trip_length: 0, quote_currency: 'AUD')
    assert_equal 60_00, result.quote_cents
  end
end
