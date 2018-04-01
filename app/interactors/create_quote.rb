class CreateQuote
  include Interactor

  def call
    context.quote = Quote.new(
      age: context.age,
      trip_length: context.trip_length,
      quote_cents: context.quote_cents,
      quote_currency: context.quote_currency
    )
    context.fail!(error: error_message) unless context.quote.save
  end

  private

  def error_message
    "#{context.quote.errors.full_messages.join('. ')}."
  end
end
