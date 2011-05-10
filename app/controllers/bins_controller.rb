class BinsController < ApplicationController
  expose(:bin) { Bin.find_by_secret_hash(params[:secret_hash]) }
  expose(:link) { bin.links.new }

end
