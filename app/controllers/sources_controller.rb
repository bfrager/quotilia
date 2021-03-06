class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  def index
    @sources = Source.all
  end

  def show
  end

  def new
    @source = Source.new
  end

  def edit
  end

  def create
    @source = Source.new source_params
    if @source.save
      redirect_to sources_path, notice: "Successfully created new source!"
    else
      render 'new'
    end
  end

  def update
    if @source.update source_params
      redirect_to sources_path, notice: "Updated source!"
    else
      render 'edit'
    end
  end

  def destroy
    @source.destroy
    redirect_to sources_path
  end


  private
    def set_source
      @source = Source.find(params[:id])
    end

    def source_params
      params.require(:source).permit(:title, :type, :link)
    end
end
