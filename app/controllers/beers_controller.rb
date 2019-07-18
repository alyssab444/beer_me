class BeersController < ApplicationController


  def new
    @beer = Beer.new
  end

  def create
      @beer = Beer.new(beer_params)
      @beer.save
      redirect_to '/beers'
end

  def edit
    if logged_in?
    @beer = Beer.find_by(params[:id])
    @beer.update(beer_params)
  else
    redirect '/login'
  end

  end



  private
    def beer_params
      params.require(:beer).permit(:name, :style, :region, :abv)
    end
end
