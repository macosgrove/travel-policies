# frozen_string_literal: true

class CreateQuote
  include Interactor

  def call
    context.quote = Quote.new(
      age: context.age,
      trip_length: context.trip_length,
      quote_currency: context.quote_currency
    )
  end
end
