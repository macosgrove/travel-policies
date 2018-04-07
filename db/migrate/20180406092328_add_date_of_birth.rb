# frozen_string_literal: true

class AddDateOfBirth < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :date_of_birth, :date
  end
end
