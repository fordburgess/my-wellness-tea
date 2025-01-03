class TeasController < ApplicationController
  def index
    @categories = TeaDetail.distinct.pluck(:category)
    @teas = Tea.all
  end

  def show
    @tea = Tea.find(params[:id])
  end
end
