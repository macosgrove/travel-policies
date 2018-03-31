require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test 'returns the formatted amount of the quote' do
    quote = Quote.new(age: 18, trip_length: 0, quote_cents: 45_23, quote_currency: 'AUD')
    assert_equal '$45.23 AUD', quote.formatted_quote
  end

  test 'it stores the quote cents and currency in the database and restores the Money quote when it is read' do
    quote = Quote.new(age: 53, trip_length: 14, quote_cents: 15_21, quote_currency: 'USD')
    quote.save!
    assert_equal '$15.21 USD', quote.reload.formatted_quote
  end
end
