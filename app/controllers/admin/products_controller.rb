class Admin::ProductsController < ApplicationController


  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.where(type: params[:type])
  end
end
