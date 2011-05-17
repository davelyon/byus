class BinsController < ApplicationController
  expose(:bin) { Bin.find_by_secret_hash(params[:id]) || Bin.new(params[:bin]) }
  expose(:link) { bin.links.build(params[:link]) }

  def create
    if bin.save
      redirect_to bin_links_path(bin)
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
    redirect_to bin_links_path(bin)
  end
end
