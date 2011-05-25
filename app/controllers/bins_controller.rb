class BinsController < ApplicationController
  expose(:bin) { Bin.find_by_secret_hash(params[:id]) || Bin.new(params[:bin]) }

  def create
    unless bin.links.first.valid?
      bin.title = bin.links.first.location
      bin.links.clear
    end
    if bin.save
      redirect_to bin_links_path(bin)
    else
      flash.now[:error] = "Unable to create a new bin"
      render 'new'
    end
  end

  def update
    if bin.update_attributes(params[:bin])
      flash[:success] = "Bin Updated: "
      flash[:success] << "Updated name!" if params[:bin][:title]
      flash[:success] << "Bin is now #{ bin.public_status }" if params[:bin][:allow_public]
    else
      flash[:error] = "Unable to update bin"
    end
    redirect_to bin_links_path(bin)
  end

  def title
    "Make a Bin"
  end
end
