require 'test_helper'

class SaveQuoteTest < ActiveSupport::TestCase
  test 'saves the quote' do
    valid_quote = Quote.new(age: 37, trip_length: 5, quote_cents: 15_23, quote_currency: 'AUD')
    result = SaveQuote.call(quote: valid_quote)
    assert_equal true, result.success?
    assert_not_nil result.quote.id
  end

  test 'fails if the quote cannot be saved' do
    invalid_quote = Quote.new(age: nil, trip_length: nil, quote_cents: 15_23, quote_currency: 'AUD')
    result = SaveQuote.call(quote: invalid_quote)
    assert_equal false, result.success?
    assert_equal "Age can't be blank. Trip length can't be blank.", result.error
  end
end
