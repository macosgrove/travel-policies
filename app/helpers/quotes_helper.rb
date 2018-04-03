# frozen_string_literal: true

module QuotesHelper
  def quote_trip_lengths
    [
      [t('date_ranges.up_to_7'), 0],
      [t('date_ranges._8_to_14'), 8],
      [t('date_ranges._15_to_21'), 15],
      [t('date_ranges.over_21'), 22]
    ]
  end

  def min_days_to_trip_length_description(min_days)
    quote_trip_lengths.select { |key_value| key_value[1] == min_days }.first[0]
  end
end
