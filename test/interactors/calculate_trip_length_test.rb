# frozen_string_literal: true

require 'test_helper'

class CalculateTripLengthTest < ActiveSupport::TestCase
  test 'calculates trip length in decimal days as the duration between trip start and trip end' do
    result = CalculateTripLength.call(
      quote:
        Quote.new(
          trip_starts_at: Time.parse('2018-04-02 23:55').utc,
          trip_ends_at: Time.parse('2018-04-04 00:05').utc
        )
    )
    assert_equal 1.007, result.quote.trip_length.round(3)
  end
end
