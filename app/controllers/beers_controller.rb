class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
    #@beer.comments.build()
  end

  def create
      @beer = Beer.new(beer_params)
      if @beer.save
        redirect_to beer_path(@beer)
    else
      render :new
    end
end

def show
  @beer = Beer.find(params[:id])
  #@comment = @beer.comments.build
end

  def edit
    if logged_in?
    @beer = Beer.find(params[:id])
  else
    redirect '/login'
  end 
  end



  private
    def beer_params
      params.require(:beer).permit(:name, :style, :region, :abv)
    end
end
