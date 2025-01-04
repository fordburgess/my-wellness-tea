class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product.id)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.where(type: params[:type])
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :stock, :type)
  end
end
