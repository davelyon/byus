class LinksController < ApplicationController
  expose(:bin_link) do
    location = params[:link][:location]
    secret = params[:link][:secret_hash]
    bin = Bin.find_by_secret_hash(secret)
    bin ? bin.links.new(location: location) : nil
  end

  expose(:link) do
    location = params[:link][:location]
    bin_link || Link.new(location: location)
  end

  def create
    if link.save
      flash[:success] = "Link Added"
      redirect_to bin_path link.bin.secret_hash
    else
      flash[:error] = "Unable to add link"
      redirect_back_or_landing
    end
  end

  def destroy
    Link.find_by_id(params[:id]).destroy
    flash[:success] = "Link deleted"
    redirect_to bin_path(params[:bin_id])
  end

  private
  def redirect_back_or_landing
    secret = params[:link][:secret_hash]
    redirect_to ( secret.nil? ? root_path : bin_path(secret) )
  end
end
