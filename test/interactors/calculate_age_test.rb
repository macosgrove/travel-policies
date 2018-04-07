# frozen_string_literal: true

require 'test_helper'

class CalculateAgeTest < ActiveSupport::TestCase
  test 'calculates the trip midpoint when the trip is a day long' do
    midpoint = CalculateAge.call(
      quote:
        Quote.new(
          date_of_birth: Date.parse('2000-06-30'),
          trip_starts_at: Time.zone.parse('2021-02-28 00:00').utc,
          trip_ends_at: Time.zone.parse('2021-03-01 00:00').utc
        )
    ).trip_midpoint
    assert_equal Time.zone.parse('2021-02-28 12:00').utc, midpoint
  end

  test 'calculates the trip midpoint when the trip is a year long' do
    midpoint = CalculateAge.call(
      quote:
        Quote.new(
          date_of_birth: Date.parse('2000-06-30'),
          trip_starts_at: Time.zone.parse('2020-01-01 00:00').utc,
          trip_ends_at: Time.zone.parse('2021-01-01 00:00').utc
        )
    ).trip_midpoint
    assert_equal Time.zone.parse('2020-07-02 00:00').utc, midpoint
  end

  test "calculates traveller's age as at the midpoint of the trip when the birthday is just before the midpoint" do
    quote = CalculateAge.call(
      quote:
        Quote.new(
          date_of_birth: Date.parse('2000-07-01'),
          trip_starts_at: Time.zone.parse('2020-01-01 00:00').utc,
          # traveller turns 20 on 2020-07-01. Midpoint is 2020-07-02 00:00
          trip_ends_at: Time.zone.parse('2021-01-01 00:00').utc
        )
    ).quote
    assert_equal 20, quote.age
  end

  test "calculates traveller's age as at the midpoint of the trip when the birthday is just after the midpoint" do
    quote = CalculateAge.call(
      quote:
        Quote.new(
          date_of_birth: Date.parse('2000-07-03'),
          trip_starts_at: Time.zone.parse('2020-01-01 00:00').utc,
          # traveller turns 20 on 2020-07-03. Midpoint is 2020-07-02 00:00
          trip_ends_at: Time.zone.parse('2021-01-01 00:00').utc
        )
    ).quote
    assert_equal 19, quote.age
  end

  test "calculates traveller's age as at the midpoint of the trip when the birthday is on the midpoint" do
    quote = CalculateAge.call(
      quote:
        Quote.new(
          date_of_birth: Date.parse('2000-07-02'),
          trip_starts_at: Time.zone.parse('2020-01-01 00:00').utc,
          # traveller turns 20 on 2020-07-02. Midpoint is 2020-07-02 00:00
          trip_ends_at: Time.zone.parse('2021-01-01 00:00').utc
        )
    ).quote
    assert_equal 20, quote.age
  end

  test "calculates traveller's age correctly when they are born on a leap day" do
    quote = CalculateAge.call(
      quote:
        Quote.new(
          date_of_birth: Date.parse('2000-02-29'),
          trip_starts_at: Time.zone.parse('2021-02-28 00:00').utc,
          # traveller turns 21 on 2021-01-03. Midpoint is 2021-02-28 12:00
          trip_ends_at: Time.zone.parse('2021-03-01 00:00').utc
        )
    ).quote
    assert_equal 20, quote.age
  end
end
