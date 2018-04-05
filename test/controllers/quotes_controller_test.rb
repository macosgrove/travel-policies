# frozen_string_literal: true

require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test 'should get index' do
    get quotes_url
    assert_response :success
  end

  test 'should get new' do
    get new_quote_url
    assert_response :success
  end

  test 'should create quote' do
    assert_difference('Quote.count') do
      post quotes_url, params: {
        quote: {
          age: @quote.age,
          trip_starts_at: @quote.trip_starts_at,
          trip_ends_at: @quote.trip_ends_at
        }
      }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test 'should not save the quote and flash an error message if the quote builder fails' do
    mock_organizer_response = Minitest::Mock.new
    mock_organizer_response.expect :success?, false
    mock_organizer_response.expect :error, 'error message'
    mock_organizer_response.expect :quote, @quote

    BuildQuote.stub :call, mock_organizer_response do
      assert_no_difference('Quote.count') do
        post quotes_url, params: { quote: {
          age: @quote.age,
          trip_length: @quote.trip_length
        } }
      end
      assert_equal 'error message', flash[:error]
    end
  end

  test 'should show quote' do
    get quote_url(@quote)
    assert_response :success
  end
end
