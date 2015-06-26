class AdvertisementController < ApplicationController
  def index
    @advertisement = advertisement.all
  end

  def show
    @advertisement = advertisement.all 
  end
end

