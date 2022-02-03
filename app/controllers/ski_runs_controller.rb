class SkiRunsController < ApplicationController
  def index
    @ski_runs = SkiRun.all
  end
end
