class BinsController < ApplicationController
  expose(:bin) do
    Bin.find_by_secret_hash(params[:id]) || Bin.new(params[:bin])
  end
  expose(:link) { bin.links.new }
  expose(:links) do
    time = params[:time].nil? ? 24 : [params[:time].to_i, 168].min
    bin.links.where("created_at >= ?", time.hours.ago)
  end

  def create
    if bin.save
      redirect_to bin
    else
      flash.now[:error] = "Unable to create a new bin"
      render 'new'
    end
  end

  def update
    if bin.update_attributes(params[:bin])
      flash[:success] = "Updated name!"
    else
      flash[:error] = "Unable to change name!"
    end
    redirect_to bin
  end
end
