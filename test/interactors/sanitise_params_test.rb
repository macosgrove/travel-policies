# frozen_string_literal: true

require 'test_helper'

class SanitiseParamsTest < ActiveSupport::TestCase
  test 'converts age to an integer' do
    result = SanitiseParams.call(age: '27')
    assert_equal 27, result.age
  end

  test 'converts trip length to an integer' do
    result = SanitiseParams.call(trip_length: '17')
    assert_equal 17, result.trip_length
  end
end
