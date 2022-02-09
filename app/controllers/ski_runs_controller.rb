class SkiRunsController < ApplicationController
  def index
    @ski_runs = SkiRun.is_open
  end

  def show
    @ski_run = SkiRun.find_by_id(params[:id])
  end

  def edit
    @ski_run = SkiRun.find(params[:id])
  end

  def update
    ski_run_params
    ski_run = SkiRun.find(params[:id])
    ski_run.update(ski_run_params)
    redirect_to "/ski_runs/#{ski_run.id}"
  end

  def destroy
    SkiRun.destroy(params[:id])
    redirect_to '/ski_runs'
  end

  private

  def ski_run_params
    params.require(:ski_run).permit(:name, :open, :distance, :condition, :green, :blue, :black)
  end
end
