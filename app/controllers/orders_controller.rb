class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user if user_signed_in?

    @current_cart.line_items.each do |item|
      @order.line_items << item
    end

    respond_to do |format|
      if @order.save
        @current_cart.destroy
        format.json { render json: { id: @order.id } }
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
