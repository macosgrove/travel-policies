# frozen_string_literal: true

require 'application_system_test_case'

class QuotesFlowTest < ApplicationSystemTestCase
  test 'Correct an error and retry' do
    visit new_quote_path

    fill_in 'Age of Traveller', with: '70'
    select('Up to 7 days', from: :trip_length)
    click_on 'Get Quote'
    assert_text 'Sorry, travellers over the age of 69 are not covered by our policy'
    assert_field 'Age of Traveller', with: '70'

    fill_in 'Age of Traveller', with: '69'
    click_on 'Get Quote'
    assert_selector 'h1', text: "Here's your quote"
    assert_text 'A trip of up to 7 days for a traveller aged 69 will cost $70.00 AUD'
  end

  test 'Get quote, then return for a second quote' do
    visit new_quote_path

    fill_in 'Age of Traveller', with: '35'
    select('8 to 14 days', from: :trip_length)
    click_on 'Get Quote'
    assert_selector 'h1', text: "Here's your quote"

    click_on 'Get Another Quote'
    assert_selector 'h1', text: 'How much will my travel insurance cost?'
  end
end
