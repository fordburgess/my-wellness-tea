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

  def index
    @teas = Tea.all
  end

  def edit
    @tea = Tea.find(params[:id])
  end

  def update
    @tea = Tea.find(params[:id])

    respond_to do |format|
      if @tea.update(tea_params)
        format.html { redirect_to admin_teas_path, notice: "Produit mis à jour avec succès." }
      end
    end
  end

  private

  def tea_params
    params.require(:tea).permit(:title, :price, :stock, tea_detail_attributes: [:infusion_time, :infusion_temperature, :time_of_day, :dosage], images: [], plant_ids: [])
  end
end
