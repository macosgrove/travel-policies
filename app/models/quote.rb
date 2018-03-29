class Quote < ApplicationRecord

  attr_reader :quote

  after_initialize :create_quote

  def create_quote
    @quote = Money.new(quote_cents, quote_currency)
  end

  def formatted_quote
    quote&.format(:with_currency => true)
  end
end
