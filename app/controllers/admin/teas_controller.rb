class Admin::TeasController < ApplicationController
  def new
    @tea = Tea.new
    @tea.build_tea_detail
  end

  def create
    @tea = Tea.new(tea_params)

    if @tea.save
      @tea.tea_detail.update(product_id: @tea.id) if @tea.tea_detail
      redirect_to admin_tea_path(@tea.id)
    else
      puts @tea.errors.full_messages
      render :new
    end
  end

  def show
    @tea = Tea.find(params[:id])
  end

  private

  def tea_params
    params.require(:tea).permit(:title, :price, :stock, tea_detail_attributes: [:infusion_time, :infusion_temperature, :time_of_day, :dosage])
  end
end
