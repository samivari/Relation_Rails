class SkiResortRunsController < ApplicationController
  def index
    @ski_resort = SkiResort.find(params[:ski_resort_id])
    @ski_runs = @ski_resort.ski_runs
  end

  def new
    @ski_resort = SkiResort.find(params[:ski_resort_id])
  end

  def create
    ski_resort = SkiResort.find(params[:ski_resort_id])
    ski_runs = ski_resort.ski_runs.create!(ski_resort_runs_params)
    redirect_to "/ski_resorts/#{ski_resort.id}/ski_runs"
  end

  def ski_resort_runs_params
    params.permit(:name, :open, :distance, :condition, :green, :blue, :black)
  end
end
