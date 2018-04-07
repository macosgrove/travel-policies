# frozen_string_literal: true

require 'test_helper'

class CreateQuoteTest < ActiveSupport::TestCase
  test 'creates the quote model (minus the quote cents)' do
    quote = CreateQuote.call(
      date_of_birth: '1978-03-05',
      trip_starts_at: '2018-04-19T12:30',
      trip_ends_at: '2018-05-19T15:25',
      quote_currency: 'AUD'
    ).quote
    assert_equal Date.parse('1978-03-05'), quote.date_of_birth
    # For now we assume the trip starts and ends in the same timezone.
    # Since we are going to take the difference between the times, the zone does not matter, so we assume UTC.
    assert_equal Time.zone.parse('2018-04-19T12:30Z').utc, quote.trip_starts_at
    assert_equal Time.zone.parse('2018-05-19T15:25Z').utc, quote.trip_ends_at
    assert_nil quote.trip_length
    assert_nil quote.quote_cents
    assert_nil quote.age
    assert_equal 'AUD', quote.quote_currency
  end
end
