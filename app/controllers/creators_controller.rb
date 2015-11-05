class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :edit, :update, :destroy]

  def index
    @creators = Creator.all
  end

  def show
  end

  def new
    @creator = Creator.new
  end

  def edit
  end

  def create
    @creator = Creator.new creator_params
    if @creator.save
      redirect_to creators_path, notice: "Successfully created new Person!"
    else
      render 'new'
    end
  end

  def update
    if @creator.update creator_params
      redirect_to creators_path, notice: "Created updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @creator.destroy
  end


  private
    def set_creator
      @creator = Creator.find(params[:id])
    end

    def creator_params
      params.require(:creator).permit(:name, :nationality, :born, :died)
    end
end
