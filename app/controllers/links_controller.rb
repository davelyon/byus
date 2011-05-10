class LinksController < ApplicationController
  expose(:bin_link) do
    bin = Bin.find_by_secret_hash(secret)
    bin ? bin.links.new(location: location) : nil
  end

  expose(:link) { bin_link || Link.new(location: location) }

  def create
    if link.save
      flash[:success] = "Link Added"
      redirect_to bin_path link.bin.secret_hash
    else
      flash[:error] = "Unable to add link"
      redirect_back_or_landing
    end
  end

  protected

  def location
    params[:link][:location]
  end

  def secret
    params[:link][:secret_hash]
  end

  def redirect_back_or_landing
    redirect_to ( secret.nil? ? root_path : bin_path(secret) )
    # if secret.nil?
      # redirect_to root_path
    # else
      # redirect_to bin_path(secret)
    # end
  end
end
