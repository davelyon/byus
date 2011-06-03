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
  expose(:links) do
    if params[:time]
      bin.links.from_hours_ago(params[:time])
    else
      bin.links.since(params[:since])
    end
  end
  expose(:latest_links) { Link.nonprivate.latest }

  def index
    if bin.nil?
      flash[:error] = "That bin does not exist"
      redirect_to root_path
    else
      respond_to do |wants|
        wants.html
        wants.xml { render action: 'index', layout: false }
        wants.json { render json: links }
      end
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
    link = bin.links.find(params[:id])
    link.destroy
    respond_to do |wants|
      wants.html do
        flash[:success] = "Link deleted"
        redirect_to bin_links_path(bin)
      end
      wants.json { render json: link }
    end
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
