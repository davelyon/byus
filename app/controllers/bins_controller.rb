class BinsController < ApplicationController
  expose(:bin) { Bin.find_by_secret_hash(params[:id]) }
  expose(:link) { bin.links.new }
end
