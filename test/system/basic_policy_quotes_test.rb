require "application_system_test_case"

class BasicPolicyQuotesTest < ApplicationSystemTestCase
  test "Obtaining a basic quote" do
    visit new_quote_path

    assert_selector "h1", text: "How much will my travel insurance cost?"
    fill_in "Age of Traveller", with: "51"
    select('Up to 7 days', :from=>:trip_length)
    click_on "Get Quote"

    assert_selector "h1", text: "Here's your quote"
    assert_text "A trip of up to 7 days for a traveller aged 51 will cost $60.00 AUD"
  end

  test "Traveller is too young" do
    visit new_quote_path

    fill_in "Age of Traveller", with: "17"
    select('Up to 7 days', :from=>:trip_length)
    click_on "Get Quote"

    assert_text 'Sorry, travellers under the age of 18 are not covered by our policy'
  end
end
