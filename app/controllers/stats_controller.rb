class StatsController < ApplicationController
  expose(:domains) { Domain.top }

  def title
    "Stats"
  end
end
