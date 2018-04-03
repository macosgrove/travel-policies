# frozen_string_literal: true

class SaveQuote
  include Interactor

  def call
    context.fail!(error: error_message) unless context.quote.save
  end

  private

  def error_message
    "#{context.quote.errors.full_messages.join('. ')}."
  end
end
