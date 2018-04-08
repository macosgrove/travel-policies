# frozen_string_literal: true

class CalculateQuote
  include Interactor

  def call
    quote = context.quote
    integer_trip_length = quote.trip_length.round
    quote.quote_cents = lookup_quote(quote.age, integer_trip_length)
  end

  private

  MAX_TRIP_DAYS = 365

  QUOTE_TABLE = [
    OpenStruct.new(min_length: 0, max_length: 7, min_age: 18, max_age: 49, quote_cents: 50_00),
    OpenStruct.new(min_length: 0, max_length: 7, min_age: 50, max_age: 59, quote_cents: 60_00),
    OpenStruct.new(min_length: 0, max_length: 7, min_age: 60, max_age: 69, quote_cents: 70_00),

    OpenStruct.new(min_length: 8, max_length: 14, min_age: 18, max_age: 49, quote_cents: 60_00),
    OpenStruct.new(min_length: 8, max_length: 14, min_age: 50, max_age: 59, quote_cents: 73_00),
    OpenStruct.new(min_length: 8, max_length: 14, min_age: 60, max_age: 69, quote_cents: 80_00),

    OpenStruct.new(min_length: 15, max_length: 21, min_age: 18, max_age: 49, quote_cents: 70_00),
    OpenStruct.new(min_length: 15, max_length: 21, min_age: 50, max_age: 59, quote_cents: 80_00),
    OpenStruct.new(min_length: 15, max_length: 21, min_age: 60, max_age: 69, quote_cents: 90_00),

    OpenStruct.new(min_length: 22, max_length: MAX_TRIP_DAYS, min_age: 18, max_age: 49, quote_cents: 82_00),
    OpenStruct.new(min_length: 22, max_length: MAX_TRIP_DAYS, min_age: 50, max_age: 59, quote_cents: 90_00),
    OpenStruct.new(min_length: 22, max_length: MAX_TRIP_DAYS, min_age: 60, max_age: 69, quote_cents: 100_00)
  ].freeze

  def lookup_quote(age, length)
    matching_rows = QUOTE_TABLE.select { |row| row_matches_trip_length(row, length) && row_matches_age(row, age) }
    context.fail!(error: I18n.t('no_quote', age: age, length: length)) if matching_rows.empty?
    raise 'Overlapping quotes! Coding error in calculate_quote!' unless matching_rows.count == 1 # should NEVER happen!
    matching_rows.first.quote_cents
  end

  def row_matches_age(row, age)
    row.min_age <= age &&  age <= row.max_age
  end

  def row_matches_trip_length(row, length)
    row.min_length <= length && length <= row.max_length
  end
end
