class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @quotes = @user.quotes.all.order("created_at DESC")
    # @quotes = Quote.all.order("created_at DESC")

  end

  def new
    @quote = Quote.new
    @creator = Creator.new
    @source = Source.new
  end

  def create
    @quote = Quote.new(quote_params)
    @creator = Creator.where(params[:creator_attributes][:name]).first_or_create
    @source = Source.where(params[:source_attributes][:title]).first_or_create
    @user = current_user
    @user.quotes << @quote
    @creator.quotes << @quote
    @source.quotes << @quote
    if @quote.save && @creator.save && @source.save
      flash[:quote_id] = @quote.id
      redirect_to @quote, notice: "Successfully created new quote!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @quote.update quote_params
      redirect_to @quote, notice: "Quote was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @quote.destroy
  end

  private
      def set_quote
        @quote = Quote.find(params[:id])
      end

      def quote_params
        params.require(:quote).permit(:content, creator_attributes: [:name], source_attributes: [:title])
      end
end
