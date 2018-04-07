# frozen_string_literal: true

require 'application_system_test_case'
SimpleCov.command_name 'System Tests'

class BasicPolicyQuotesTest < ApplicationSystemTestCase
  include DateSelectHelper

  test 'Obtaining a basic quote' do
    visit new_quote_path

    assert_selector 'h1', text: 'How much will my travel insurance cost?'
    select_date Date.parse('26/08/1966'), from: 'quote_date_of_birth'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    fill_in 'quote_trip_ends_at', with: "27/08/2018 \t0345p"
    click_on 'Get Quote'

    assert_selector 'h1', text: "Here's your quote"
    assert_text 'A trip of 7 days for a traveller aged 51 will cost $60.00 AUD'
  end

  test 'Traveller is too young' do
    visit new_quote_path

    select_date Date.parse('27/08/2001'), from: 'quote_date_of_birth'
    fill_in 'quote_trip_starts_at', with: "20/08/2018 \t0345p"
    fill_in 'quote_trip_ends_at', with: "27/08/2018 \t0345p"
    click_on 'Get Quote'

    assert_text 'Sorry, travellers under the age of 18 are not covered by our policy'
  end
end
