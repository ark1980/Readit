class AdvertismentsController < ApplicationController
  def index
    @advertisments = Advertisment.all
  end

  def show
    @advertisment = Advertisment.find(params[:id])
  end
end
