class StatsController < ApplicationController
  expose(:domains) { Domain.top }
  def index
  end

end
