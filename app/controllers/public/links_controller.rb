class Public::LinksController < ApplicationController
  expose(:bin) { Bin.includes(:links).find_by_public_hash(params[:bin_id])}
  expose(:links) { bin.links.from_hours_ago(params[:time])}

  def index
    if bin && bin.allow_public?
      respond_to do |wants|
        wants.html
        wants.xml { render action: 'index', layout: false }
      end
    else
      flash[:error] = "That bin is private!"
      redirect_to root_path
    end
  end

  def title
    "#{bin.title} Bin"
  end

end
