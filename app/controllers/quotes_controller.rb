class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # POST /quotes
  # POST /quotes.json
  def create
    result = BuildQuote.call(quote_params.merge(quote_currency: 'AUD')) # Eventually currency will be selected by the user

    respond_to do |format|
      @quote = result.quote
      if result.success?
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        flash[:error] = result.error
        format.html { render :new }
        format.json { render json: result.error, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:age, :trip_length, :quote_cents, :quote_currency)
    end
end
