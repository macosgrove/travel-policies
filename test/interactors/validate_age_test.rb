require 'test_helper'

class ValidateAgeTest < ActiveSupport::TestCase
  test "fails if age is less than 18" do
    result = ValidateAge.call(age: 15, trip_length: 17)
    assert_equal false, result.success?
    assert_equal I18n.t('too_young'), result.error
  end

  test "fails if age is over 69" do
    result = ValidateAge.call(age: 70, trip_length: 17)
    assert_equal false, result.success?
    assert_equal I18n.t('too_old'), result.error
  end
end
