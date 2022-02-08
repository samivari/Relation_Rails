class SkiRunsController < ApplicationController
  def index
    @ski_runs = SkiRun.all
  end

  def show
    @ski_run = SkiRun.find_by_id(params[:id])
  end

  def edit
    @ski_run = SkiRun.find(params[:id])
  end

  def update
    ski_run = SkiRun.find(params[:id])
    ski_run.update(ski_run_params)
    redirect_to "/ski_runs/#{ski_run.id}"
  end

  private

  def ski_run_params
    params.permit(:name, :open, :distance, :condition, :green, :blue, :black)
  end
end
