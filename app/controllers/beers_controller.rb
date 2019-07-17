class BeersController < ApplicationController

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params(:name, :style, :region, :abv))

  end

  def edit
    @beer = Beer.find_by(params[:id])
    @beer.update(beer_params(:name, :style, :region, :abv))

  end



  private
    def beer_params
      params.require(:beer).permit(:name, :style, :region, :abv)
    end
end
