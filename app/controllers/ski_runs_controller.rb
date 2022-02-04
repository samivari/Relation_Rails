class SkiRunsController < ApplicationController
  def index
    @ski_runs = SkiRun.all
  end

  def show
    @ski_run = SkiRun.find_by_id(params[:id])
  end
end
