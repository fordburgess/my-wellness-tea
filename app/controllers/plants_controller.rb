class PlantsController < ApplicationController
  def index
    @plants = Plant.all

    @plants_wellbeing = Tea.joins(:tea_detail).where(tea_detail: { category: 'Bien-être' })

    @teas_wellbeing_women = Tea.joins(:tea_detail).where(tea_detail: { category: 'Bien-être chez la femme' })
    @plants_wellbeing_women = @teas_wellbeing_women.flat_map(&:plants).uniq



    @plants_winter = Tea.joins(:tea_detail).where(tea_detail: { category: 'Hiver' })

    @plants_digestion = Tea.joins(:tea_detail).where(tea_detail: { category: 'Bien-être digestif' })
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
