# frozen_string_literal: true

class ValidateTripDates
  include Interactor

  # This method is simple to understand despite its ABC size. There seemed no good way to shorten it.
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  def call
    quote = context.quote
    context.fail!(error: start_date_message) if quote.trip_starts_at.nil?
    context.fail!(error: end_date_message) if quote.trip_ends_at.nil?
    context.fail!(error: start_future_message) if quote.trip_starts_at <= Time.current
    context.fail!(error: start_before_end_message) if quote.trip_starts_at >= quote.trip_ends_at
    context.fail!(error: max_future_message) if quote.trip_starts_at > 1.year.from_now
    context.fail!(error: max_length_message) if trip_length(quote) > CalculateQuote::MAX_TRIP_DAYS.days
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity

  private

  def start_date_message
    I18n.t('cant_be_blank', field: I18n.t('trip_start_date'))
  end

  def end_date_message
    I18n.t('cant_be_blank', field: I18n.t('trip_end_date'))
  end

  def start_future_message
    I18n.t('must_be_future', field: I18n.t('trip_start_date'))
  end

  def start_before_end_message
    I18n.t('must_be_after', field1: I18n.t('trip_start_date').downcase, field2: I18n.t('trip_end_date'))
  end

  def max_future_message
    I18n.t('trip_max_future')
  end

  def max_length_message
    I18n.t('trip_max_length')
  end

  def trip_length(quote)
    quote.trip_ends_at - quote.trip_starts_at
  end
end
