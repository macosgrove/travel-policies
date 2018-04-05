# frozen_string_literal: true

class AddTripDateTimes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :trip_starts_at, :datetime
    add_column :quotes, :trip_ends_at, :datetime
  end
end
