# frozen_string_literal: true

require 'test_helper'

class ValidateDatesTest < ActiveSupport::TestCase
  test 'fails if start date is blank' do
    result = ValidateTripDates.call(quote: Quote.new(trip_ends_at: 1.month.from_now))
    assert_equal false, result.success?
    assert_equal "Trip start date can't be blank", result.error
  end

  test 'fails if end date is blank' do
    result = ValidateTripDates.call(quote: Quote.new(trip_starts_at: 2.months.from_now))
    assert_equal false, result.success?
    assert_equal "Trip end date can't be blank", result.error
  end

  test 'fails if start date is not in the future' do
    result = ValidateTripDates.call(quote: Quote.new(trip_starts_at: Time.current, trip_ends_at: 2.days.from_now))
    assert_equal false, result.success?
    assert_equal 'Trip start date must be in the future', result.error
  end

  test 'fails if start date is after end date' do
    result = ValidateTripDates.call(quote: Quote.new(trip_starts_at: 3.days.from_now, trip_ends_at: 2.days.from_now))
    assert_equal false, result.success?
    assert_equal 'Trip end date must be after trip start date', result.error
  end

  test 'fails if start date more than a year in the future' do
    result = ValidateTripDates.call(quote: Quote.new(
      trip_starts_at: 1.year.from_now + 1.second,
      trip_ends_at: 1.year.from_now + 1.week
    ))
    assert_equal false, result.success?
    assert_equal 'Trip start date must be within a year from now', result.error
  end

  test 'fails if the trip is more than a year long' do
    result = ValidateTripDates.call(quote: Quote.new(
      trip_starts_at: 3.days.from_now,
      trip_ends_at: 1.year.from_now + 4.days
    ))
    assert_equal false, result.success?
    assert_equal 'Sorry, we only cover trips up to one year long', result.error
  end
end
