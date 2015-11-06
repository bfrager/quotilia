class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all.order("created_at DESC")

  end

  def new
    @quote = current_user.quotes.build
    # @creator = Creator.new
    # @source = Source.new
  end

  def create
    # defaults = {:content=>"", :creator_attributes[:name]=>"", :source_attributes[:title]=>""}
    # quote_params = defaults.merge(quote_params)
    @quote = current_user.quotes.build(quote_params)
    # @creator = Creator.where(params[:creator_attributes][:name]).first_or_create
    # @source = Source.where(params[:source_attributes][:title]).first_or_create
    @user = current_user
    @user.quotes << @quote
    # @creator.quotes << @quote
    # @source.quotes << @quote
    if @quote.save # && @creator.save && @source.save
      redirect_to @quote, notice: "Successfully created new quote!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    # @quote = Quote.new(quote_params)
    # @creator = Creator.new(quote_params[creator_attributes])
    # @source = Source.new(quote_params[source_attributes])
    # @creator = Creator.where(params[:creator_attributes][:name]).first_or_create
    # @source = Source.where(params[:source_attributes][:title]).first_or_create
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
    redirect_to quotes_path, notice: "Quote deleted!"
  end

  private
      def set_quote
        @quote = Quote.find(params[:id])
      end

      def quote_params
        params.require(:quote).permit(:content, creator_attributes: [:name], source_attributes: [:title])
      end
end
