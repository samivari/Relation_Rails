class SkiResortsController < ApplicationController
  def index
    @ski_resorts = SkiResort.all
  end

  def show
    @ski_resort = SkiResort.find_by(id: params[:id]) # find a ski resort by it's id thats supplied by params id
  end

  def new
    @ski_resort = SkiResort.new
  end

  def create
    SkiResort.create!(ski_resort_params)
    redirect_to '/ski_resorts'
  end

  def edit
    @ski_resort = SkiResort.find(params[:id])
  end

  def update
    ski_resort_params
    ski_resort = SkiResort.find(params[:id])
    ski_resort.update!(ski_resort_params)
    redirect_to "/ski_resorts/#{ski_resort.id}"
  end

  def destroy
    SkiResort.destroy(params[:id])
    redirect_to '/ski_resorts'
  end

  private

  def ski_resort_params
    params.require(:ski_resort).permit(:name, :lifts, :employee, :altitude, :avg_snowfall, :location, :backcountry_access,
                                       :snowboarder_permitted)
  end
end
