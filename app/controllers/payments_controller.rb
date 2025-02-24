class PaymentsController < ApplicationController
  Stripe.api_key = "sk_test_51P5XAnHLVVBFu1EItUhXzrhTjlJo3myCxKZkvMKGOONeoK7qYBhgGYuRskMHm7GYxE5IP6FczjHzGa9GmqZKDazc00abzIMZkD"

  def create
    # data = JSON.parse(request.body.read)

    # puts "cart total"
    # puts @cart_total

    payment_intent = Stripe::PaymentIntent.create(
      amount: 50,  # Dynamic total from frontend
      currency: 'chf',
      # fields: {
      #   billingDetails: "required",
      #   shippingDetails: "auto",
      # }
    )

    Rails.logger.error payment_intent

    render json: { clientSecret: payment_intent.client_secret }

  end
end
