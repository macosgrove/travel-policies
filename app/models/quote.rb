# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :age, :trip_length, :quote_cents, :quote_currency, presence: true

  def formatted_quote
    @quote ||= Money.new(quote_cents, quote_currency)
    @quote.format(with_currency: true)
  end
end
