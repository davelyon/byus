class Public::LinksController < ApplicationController
  expose(:bin) { Bin.includes(:links).select('title,public_hash').find_by_public_hash(params[:bin_id])}
  expose(:links) { bin.links }

end
