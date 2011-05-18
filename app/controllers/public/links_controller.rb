class Public::LinksController < ApplicationController
  expose(:bin) { Bin.includes(:links).find_by_public_hash(params[:bin_id])}
  expose(:links) do
    time = params[:time].nil? ? 24 : [params[:time].to_i, 168].min
    bin.links.where("updated_at >= ?", time.hours.ago)
  end

end
