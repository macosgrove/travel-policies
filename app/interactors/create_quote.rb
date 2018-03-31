class CreateQuote
  include Interactor

  def call
    context.quote = Quote.new(
      age: context.age,
      trip_length: context.trip_length,
      quote_cents: context.quote_cents,
      quote_currency: context.quote_currency
    )
  end
end
