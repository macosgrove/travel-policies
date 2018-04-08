# frozen_string_literal: true

class ValidationTest < ApplicationSystemTestCase
  include DateSelectHelper

  test 'Polite error message is given if start date is missing' do
    visit new_quote_path

    assert_selector 'h1', text: 'How much will my travel insurance cost?'
    select_date Date.parse('26/08/1966'), from: 'quote_date_of_birth'
    fill_in 'quote_trip_ends_at', with: "20/08/2018 \t0345p"
    click_on 'Get Quote'

    assert_text "Trip start date can't be blank"
  end

  test 'Polite error message is given if end date is missing' do
    visit new_quote_path

    assert_selector 'h1', text: 'How much will my travel insurance cost?'
    select_date Date.parse('26/08/1966'), from: 'quote_date_of_birth'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    click_on 'Get Quote'

    assert_text "Trip end date can't be blank"
  end

  test 'Traveller is too young' do
    visit new_quote_path

    select_date Date.parse('27/08/2001'), from: 'quote_date_of_birth'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    fill_in 'quote_trip_ends_at', with: "27/08/2018 \t0345p"
    click_on 'Get Quote'

    assert_text 'Sorry, travellers under the age of 18 are not covered by our policy'
  end

  test 'Traveller is too old' do
    visit new_quote_path

    select_date Date.parse('01/01/1948'), from: 'quote_date_of_birth'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    fill_in 'quote_trip_ends_at', with: "27/08/2018 \t0345p"
    click_on 'Get Quote'

    assert_text 'Sorry, travellers over the age of 69 are not covered by our policy'
  end
end
