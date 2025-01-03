class TeasController < ApplicationController
  def index
    @categories = TeaDetail.distinct.pluck(:category)

    if params[:category].present?
      @teas = Tea.joins(:tea_detail).where(tea_details: { category: params[:category] })
    else
      @teas = Tea.all
    end

    respond_to do |format|
      format.html
      format.js  # For AJAX
    end
  end

  def show
    @tea = Tea.find(params[:id])
  end
end
