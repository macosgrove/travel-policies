# frozen_string_literal: true

class CalculateTripLength
  include Interactor

  def call
    quote = context.quote
    quote.trip_length = seconds_to_days(quote.trip_ends_at - quote.trip_starts_at)
  end

  private

  def seconds_to_days(seconds)
    seconds / 60 / 60 / 24
  end
end
