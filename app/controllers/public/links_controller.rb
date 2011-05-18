class Public::LinksController < ApplicationController
  expose(:bin) { Bin.find_by_public_hash(params[:bin_id]) }
  expose(:links) { bin.links }

end
