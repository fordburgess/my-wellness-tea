class Admin::PlantsController < ApplicationController

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

  private

  def plant_params
    params.require(:plant).permit(:name, :latin_name, :traditional_qualities, :description, :part_used, images: [])
  end
end
