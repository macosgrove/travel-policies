class Quote < ApplicationRecord
  def formatted_quote
    @quote ||= Money.new(quote_cents, quote_currency)
    @quote.format(:with_currency => true)
  end
end
