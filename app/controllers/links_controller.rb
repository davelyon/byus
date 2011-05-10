class LinksController < ApplicationController
  expose(:bin) { Bin.find_by_secret_hash params[:bin_id] }
  expose(:link) do
    if bin
      bin.links.find_by_id(params[:id]) ||
        bin.links.new(params[:link])
    else
      Link.new(params[:link])
    end
  end

  def create
    if link.save
      flash[:success] = "Link Added"
      if request.get?
        render 'bins/_bookmarklet_response'
      else
        redirect_to bin_path link.bin.secret_hash
      end
    else
      flash[:error] = "Unable to add link"
      redirect_back_or_landing
    end
  end

  def destroy
    link.destroy
    flash[:success] = "Link deleted"
    redirect_to bin_path(params[:bin_id])
  end

  private
  def redirect_back_or_landing
    redirect_to bin.present? ? bin_path(bin) : root_path
  end
end
