class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
    # render index_url
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def create
    @cat = Cat.new(cats_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update_attributes(cats_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  private
  def cats_params
    params.require(:cat).permit(:name, :birthdate, :color, :sex, :description)
  end

end
