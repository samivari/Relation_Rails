class SkiResortsController < ApplicationController
  def index; end

  def show
    @ski_resort = SkiResort.find_by(id: params[:id]) # find a ski resort by it's id thats supplied by params id
  end
end
