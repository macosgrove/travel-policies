require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test 'returns the formatted amount of the quote' do
    quote = Quote.new(age: 18, trip_length: 0)
    assert_equal '$60.00 AUD', quote.formatted_quote
  end
end
