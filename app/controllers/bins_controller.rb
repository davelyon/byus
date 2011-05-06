class BinsController < ApplicationController
  expose(:link) { Link.new }

  def create
    bin = Bin.create!(theme: params[:link][:locaton])
    
    redirect_to bin
  end
end
