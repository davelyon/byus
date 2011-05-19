class Public::LinksController < ApplicationController
  expose(:bin) { Bin.includes(:links).find_by_public_hash(params[:bin_id])}
  expose(:links) { bin.links.from_hours_ago(params[:time])}

end
