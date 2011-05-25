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
    redirect_to root_path unless bin
    respond_to do |wants|
      wants.html
      wants.xml { render action: 'index', layout: false }
    end
  end

  def create
    link.touch unless link.new_record?
    if link.save
      if request.xhr?
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Request-Method'] = 'POST, OPTIONS'
        render text: '', status: 200
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

  def cross_site_sharing
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'POST, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With'
    headers['Access-Control-Max-Age'] = '1278000'
    headers['Content-Length'] = '0'
    headers['Content-Type'] = 'text/plain'
    render nothing: true, status: 200
  end

  def title
    if bin
      "#{bin.title} Bin"
    else
      "Latest"
    end
  end
end
