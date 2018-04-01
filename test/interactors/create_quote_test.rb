require 'test_helper'

class CreateQuoteTest < ActiveSupport::TestCase
  test 'creates the quote model (minus the quote cents)' do
    quote = CreateQuote.call(age: 37, trip_length: 5, quote_currency: 'AUD').quote
    assert_equal 37, quote.age
    assert_equal 5, quote.trip_length
    assert_equal nil, quote.quote_cents
    assert_equal 'AUD', quote.quote_currency
  end
end
