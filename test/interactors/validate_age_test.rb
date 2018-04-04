# frozen_string_literal: true

require 'test_helper'

class ValidateAgeTest < ActiveSupport::TestCase
  test 'fails if age is less than 18' do
    result = ValidateAge.call(quote: Quote.new(age: 15))
    assert_equal false, result.success?
    assert_equal I18n.t('too_young'), result.error
  end

  test 'fails if age is over 69' do
    result = ValidateAge.call(quote: Quote.new(age: 70))
    assert_equal false, result.success?
    assert_equal I18n.t('too_old'), result.error
  end
end
