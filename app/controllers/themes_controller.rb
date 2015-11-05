class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = Theme.all
  end

  def show
  end

  def new
    @theme = Theme.new
  end

  def edit
  end

  def create
    @theme = Theme.new theme_params
    if @theme.save
      redirect_to themes_path, notice: "Successfully created new theme!"
    else
      render 'new'
    end
  end

  def update
    if @theme.update theme_params
      redirect_to themes_path, notice: "Theme updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @theme.destroy
  end


  private
    def set_theme
      @theme = Theme.find(params[:id])
    end

    def theme_params
      params.require(:theme).permit(:tag)
    end
end
