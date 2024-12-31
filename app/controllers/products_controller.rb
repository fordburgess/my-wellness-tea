class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @teas = Tea.all
  end
end
