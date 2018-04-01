require "application_system_test_case"

class QuotesFlowTest < ApplicationSystemTestCase
  test 'Correct an error and retry' do
    visit new_quote_path

    fill_in "Age of Traveller", with: "70"
    select('Up to 7 days', :from=>:trip_length)
    click_on "Get Quote"
    assert_text 'Sorry, travellers over the age of 69 are not covered by our policy'
    assert_field 'Age of Traveller', with: '70'

    fill_in "Age of Traveller", with: "69"
    click_on "Get Quote"
    assert_selector "h1", text: "Here's your quote"
    assert_text 'A trip of up to 7 days for a traveller aged 69 will cost $70.00 AUD'
  end
end
