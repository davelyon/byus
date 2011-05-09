class LinksController < ApplicationController

  expose :link

  def create
    if link.save
      flash[:success] = "New bin created with your link!"
      redirect_to bin_path link.bin.secret_hash
    else
      flash.now[:error] = "Unable to create a bin with this link."
      render 'pages#landing'
    end
  end

end
