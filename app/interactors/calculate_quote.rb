class CalculateQuote
  include Interactor

  def call
    quote_amount = Money.new(60_00, 'AUD')
    context.quote = Quote.new(
      age: context.age,
      trip_length: context.trip_length,
      quote_cents: quote_amount.cents,
      quote_currency: quote_amount.currency
    )
  end
end
