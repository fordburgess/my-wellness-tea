class Admin::OrdersController < ApplicationController
  Stripe.api_key = "sk_test_51P5XAnHLVVBFu1EItUhXzrhTjlJo3myCxKZkvMKGOONeoK7qYBhgGYuRskMHm7GYxE5IP6FczjHzGa9GmqZKDazc00abzIMZkD"

  def index
    @orders = Order.all
#     payments = Stripe::PaymentIntent.list()
#
#     payments.data.each do |payment|
#       id = payment.id
#       charge = Stripe::Charge.retrieve(payment.latest_charge)
#       puts charge
#     end
  end

  def show
    @order = Order.find(params[:id])
  end
end
