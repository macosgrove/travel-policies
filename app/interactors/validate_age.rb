class ValidateAge
  include Interactor

  def call
    if context.age < 18
      context.fail!(error: I18n.t('too_young'))
    end

    if context.age > 69
      context.fail!(error: I18n.t('too_old'))
    end
  end
end
