class AdvertisementsController < ApplicationController
  def index
    @advertisement = Advertisement.all
  end

  def show
    @advertisment = Advertisement.find(params[:id])
  end
end

