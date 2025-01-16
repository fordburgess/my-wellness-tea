class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @tea = Tea.find(2)
  end
end
