require 'test_helper'

class CalculateQuoteTest < ActiveSupport::TestCase
  test 'creates the quote model' do
    result = CreateQuote.call(age: 37, trip_length: 5, quote_cents: 15_23, quote_currency: 'AUD')
    assert_equal 37, result.quote.age
    assert_equal 5, result.quote.trip_length
    assert_equal 15_23, result.quote.quote_cents
    assert_equal 'AUD', result.quote.quote_currency
  end
end
