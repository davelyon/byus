class PagesController < ApplicationController
  expose(:link) { Link.new }
  def landing
  end

end
