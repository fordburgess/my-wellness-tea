class PlantsController < ApplicationController
  def index
    @plants = Plant.all

    @teas_wellbeing = Tea.joins(:tea_detail).where(tea_detail: { category: 'Bien-être' })
    @plants_wellbeing = @teas_wellbeing.flat_map(&:plants).uniq

    @teas_wellbeing_women = Tea.joins(:tea_detail).where(tea_detail: { category: 'Bien-être chez la femme' })
    @plants_wellbeing_women = @teas_wellbeing_women.flat_map(&:plants).uniq

    @teas_winter = Tea.joins(:tea_detail).where(tea_detail: { category: 'Hiver' })
    @plants_winter = @teas_winter.flat_map(&:plants).uniq

    @teas_digestion = Tea.joins(:tea_detail).where(tea_detail: { category: 'Bien-être digestif' })
    @plants_digestion = @teas_digestion.flat_map(&:plants).uniq
  end

  def show
    @plant = Plant.find(params[:id])
    @relevant_teas = Tea.joins(:plants).where(plants: { id: @plant.id }).distinct
  end
end
