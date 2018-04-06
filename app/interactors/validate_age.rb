# frozen_string_literal: true

class ValidateAge
  include Interactor

  def call
    context.fail!(error: I18n.t('too_young')) if context.quote.age < 18
    context.fail!(error: I18n.t('too_old')) if context.quote.age > 69
  end
end
