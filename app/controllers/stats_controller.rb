class StatsController < ApplicationController

  def index
    @stats = Stats.all
  end

  def create
    current_hash_rate = params[:stat]
    Stat.create(current_hash_rate: current_hash_rate)

    # TODO: Add bitcoin price checking

    flash.now[:success] = "Added stat!"
  end

end
