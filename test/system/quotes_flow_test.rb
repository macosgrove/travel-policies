# frozen_string_literal: true

require 'application_system_test_case'

class QuotesFlowTest < ApplicationSystemTestCase
  test 'Correct an error and retry' do
    visit new_quote_path

    fill_in 'quote_age', with: '70'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    fill_in 'quote_trip_ends_at', with: "27/08/2018 \t0345p"
    click_on 'Get Quote'
    assert_text 'Sorry, travellers over the age of 69 are not covered by our policy'
    assert_field 'Age of Traveller', with: '70'

    fill_in 'quote_age', with: '69'
    click_on 'Get Quote'
    assert_selector 'h1', text: "Here's your quote"
    assert_text 'A trip of 7 days for a traveller aged 69 will cost $70.00 AUD'
  end

  test 'Get quote, then return for a second quote' do
    visit new_quote_path

    fill_in 'quote_age', with: '24'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    fill_in 'quote_trip_ends_at', with: "27/08/2018 \t0345p"
    click_on 'Get Quote'
    assert_selector 'h1', text: "Here's your quote"

    click_on 'Get Another Quote'
    assert_selector 'h1', text: 'How much will my travel insurance cost?'
  end
end
