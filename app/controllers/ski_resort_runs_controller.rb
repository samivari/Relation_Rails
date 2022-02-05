class SkiResortRunsController < ApplicationController
  def index
    ski_resort = SkiResort.find(params[:ski_resort_id])
    @ski_runs = ski_resort.ski_runs
  end
end
