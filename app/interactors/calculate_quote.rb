class CalculateQuote
  include Interactor

  def call
    context.quote_cents = 60_00
  end
end
