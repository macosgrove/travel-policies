# frozen_string_literal: true

json.extract! quote, :id, :age, :trip_length, :quote_cents, :quote_currency, :created_at, :updated_at
json.url quote_url(quote, format: :json)
