class Public::LinksController < ApplicationController
  expose(:bin) { Bin.includes(:links).find_by_public_hash(params[:bin_id])}
  expose(:links) { bin.links.from_hours_ago(params[:time])}

  def index
    redirect_to root_path unless bin.allow_public?
  end

end
