# frozen_string_literal: true

class SanitiseParams
  include Interactor

  def call
    context.age = context.age.to_i
    context.trip_length = context.trip_length.to_i
  end
end
