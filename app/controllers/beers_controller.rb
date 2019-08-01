class BeersController < ApplicationController
  before_action :current_user, only: [:index, :new, :create, :update]

  def index
    @beers = @current_user.created_beers

  end

  def new
    @beer = Beer.new
  end

  def create
      @beer = @current_user.created_beers.build(beer_params)
      if @beer.save
        redirect_to beer_path(@beer)
    else
      render :new
    end
end

def show
  @beer = Beer.find(params[:id])
end

  def edit
    if logged_in?
    @beer = Beer.find(params[:id])
    else
    redirect '/login'
    end
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      flash[:success] = "Beer Updated!"
      redirect_to beers_path
    else
      render :edit
    end
  end





  private
    def beer_params
      params.require(:beer).permit(:name, :style, :region, :abv)
    end
end
