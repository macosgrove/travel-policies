# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show; end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # POST /quotes
  # POST /quotes.json
  def create
    result = BuildQuote.call(quote_model_params(quote_params))

    respond_to do |format|
      @quote = result.quote
      if result.success?
        show_quote(format)
      else
        show_error(format, result.error)
      end
    end
  end

  private

  def show_quote(format)
    format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
    format.json { render :show, status: :created, location: @quote }
  end

  def show_error(format, error)
    flash[:error] = error
    format.html { render :new }
    format.json { render json: error, status: :unprocessable_entity }
  end

  def quote_model_params(quote_params)
    {}.tap do |params|
      year = quote_params['date_of_birth(1i)']
      month = quote_params['date_of_birth(2i)']
      day = quote_params['date_of_birth(3i)']
      params[:date_of_birth] = "#{year}-#{month}-#{day}"
      params[:trip_starts_at] = quote_params['trip_starts_at']
      params[:trip_ends_at] = quote_params['trip_ends_at']
      params[:quote_currency] = 'AUD' # Eventually currency will be selected by the user
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_quote
    @quote = Quote.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quote_params
    params.require(:quote).permit(:date_of_birth, :trip_starts_at, :trip_ends_at)
  end
end
