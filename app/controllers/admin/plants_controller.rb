class Admin::PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy]

  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)

    if @plant.save
      redirect_to admin_plants_path
    else
      puts @plant.errors.full_messages
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])

    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to admin_plants_path, notice: "Produit mis à jour avec succès." }
      end
    end
  end

  def destroy
    @plant.destroy!

    respond_to do |format|
      format.html { redirect_to admin_plants_path, notice: "Plant was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :latin_name, :traditional_qualities, :description, :part_used, images: [])
  end
end
