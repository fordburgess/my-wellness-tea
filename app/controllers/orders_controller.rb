class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @tea = Tea.find(2)
  end

  def create
    Rails.logger.error order_params
    @order = Order.new(order_params)
    @order.user = current_user if user_signed_in?

    respond_to do |format|
      if @order.save
        format.json { render json: @order.id }
        # format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        # format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :street_address, :country, :city, :post_code)
  end

end
