ActiveRecord::Schema.define(version: 20180402231850) do

  create_table "quotes", force: :cascade do |t|
    t.integer "age"
    t.decimal "trip_length"
    t.integer "quote_cents"
    t.string "quote_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "trip_starts_at"
    t.datetime "trip_ends_at"
  end

end
