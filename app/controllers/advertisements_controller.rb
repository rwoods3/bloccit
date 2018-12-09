class AdvertisementsController < ApplicationController
  def index
  	@ads = Advertisement.all
  end

  def show
  	@ad = Advertisement.find(params[:id])
  end

  def new
  	@ad = Advertisement.new
  end

  def create
  	@ad = Advertisement.new(title: params[:advertisement][:title], copy: params[:advertisement][:copy], price: params[:advertisement][:price])

  	if @ad.save
		flash[:notice] = "Advertisement was saved."
		redirect_to @ad
	else
		flash.now[:alert] = "There was an error saving the advertisement. Please try again."
		render :new
	end
  end
end
