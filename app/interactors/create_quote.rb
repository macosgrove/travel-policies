# frozen_string_literal: true

class CreateQuote
  include Interactor

  def call
    context.quote = Quote.new(
      date_of_birth: context.date_of_birth,
      trip_starts_at: context.trip_starts_at,
      trip_ends_at: context.trip_ends_at,
      quote_currency: context.quote_currency
    )
  end
end
