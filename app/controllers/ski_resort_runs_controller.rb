class SkiResortRunsController < ApplicationController
  def index
    # raise params.inspect if params['sort-by']

    @ski_resort = SkiResort.find(params[:ski_resort_id])
    @ski_runs = if params['sort-by'] == 'name' # Sort by name
                  @ski_resort.ski_runs.order('name')
                elsif params[:distance]
                  @ski_resort.ski_runs.greater_than(params[:distance])
                else
                  @ski_resort.ski_runs
                end
  end

  def new
    @ski_resort = SkiResort.find(params[:ski_resort_id])
  end

  def create
    ski_resort = SkiResort.find(params[:ski_resort_id])
    ski_runs = ski_resort.ski_runs.create!(ski_resort_run_params)
    redirect_to "/ski_resorts/#{ski_resort.id}/ski_runs"
  end

  def ski_resort_run_params
    params.permit(:name, :open, :distance, :condition, :green, :blue, :black)
  end
end
