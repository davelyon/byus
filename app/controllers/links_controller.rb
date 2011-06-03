class LinksController < ApplicationController
  expose(:bin) { Bin.find_by_secret_hash params[:bin_id] }
  expose(:link) do
    if params[:link]
      link = Link.normalize_url(params[:link][:location])
      bin.links.find_by_location(link) ||
        bin.links.build(params[:link])
    else
      bin.links.build
    end
  end
  expose(:links) { bin.links.from_hours_ago(params[:time]) }
  expose(:latest_links) { Link.nonprivate.latest }

  def index
    if bin.nil?
      flash[:error] = "That bin does not exist"
      redirect_to root_path
    else
      respond_to do |wants|
        wants.html
        wants.xml { render action: 'index', layout: false }
      end
    end
  end

  def create
    link.touch unless link.new_record?
    if link.save
      if request.xhr?
        render nothing: true, status: 200
      else
        flash[:success] = "Link Added"
        redirect_to bin_links_path link.bin.secret_hash
      end
    else
      flash[:error] = "Unable to add link"
      if bin.present?
        render 'index'
      else
        render new_bin_path
      end
    end
  end

  def latest

  end

  def destroy
    bin.links.find(params[:id]).destroy
    flash[:success] = "Link deleted"
    redirect_to bin_links_path(bin)
  end

  def bookmarklet
    render 'bins/_bookmarklet_response'
  end

  def title
    if bin
      "#{bin.title} Bin"
    else
      "Latest"
    end
  end
end
