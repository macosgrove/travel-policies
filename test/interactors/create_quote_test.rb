require 'test_helper'

class CalculateQuoteTest < ActiveSupport::TestCase
  test 'creates the quote model' do
    quote = CreateQuote.call(age: 37, trip_length: 5, quote_cents: 15_23, quote_currency: 'AUD').quote
    assert_equal 37, quote.age
    assert_equal 5, quote.trip_length
    assert_equal 15_23, quote.quote_cents
    assert_equal 'AUD', quote.quote_currency
  end
end
