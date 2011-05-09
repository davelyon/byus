class LinksController < ApplicationController

  expose :link

  def create
    if link.save
      flash[:success] = "New bin created with your link!"
      redirect_to link.bin
    else
      flash.now[:error] = "Unable to create a bin with this link."
      render 'pages#landing'
    end
  end

end
