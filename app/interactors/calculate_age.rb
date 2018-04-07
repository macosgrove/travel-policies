# frozen_string_literal: true

class CalculateAge
  include Interactor

  def call
    quote = context.quote
    context.trip_midpoint = midpoint(quote.trip_starts_at, quote.trip_ends_at)
    quote.age = age_as_at(quote.date_of_birth, context.trip_midpoint)
  end

  private

  def age_as_at(birth_date, time)
    age_at_start_of_year = time.year - birth_date.year - 1
    birthday_on_or_before_date?(birth_date, time) ? age_at_start_of_year + 1 : age_at_start_of_year
  end

  def birthday_on_or_before_date?(birth_date, time)
    birth_date.month < time.month || (birth_date.month == time.month && birth_date.day <= time.day)
  end

  def midpoint(start_time, end_time)
    start_time + (end_time - start_time) / 2
  end
end
