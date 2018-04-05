# frozen_string_literal: true

require 'test_helper'

class CreateQuoteTest < ActiveSupport::TestCase
  test 'creates the quote model (minus the quote cents)' do
    quote = CreateQuote.call(
      age: 37,
      trip_starts_at: '2018-04-19T12:30',
      trip_ends_at: '2018-05-19T15:25',
      quote_currency: 'AUD'
    ).quote
    assert_equal 37, quote.age
    # For now we assume the trip starts and ends in the same timezone.
    # Since we are going to take the difference between the times, the zone does not matter, so we assume UTC.
    assert_equal Time.parse('2018-04-19T12:30Z').utc, quote.trip_starts_at
    assert_equal Time.parse('2018-05-19T15:25Z').utc, quote.trip_ends_at
    assert_nil quote.trip_length
    assert_nil quote.quote_cents
    assert_equal 'AUD', quote.quote_currency
  end
end
