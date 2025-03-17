class PaymentsController < ApplicationController
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

  def create
    # data = JSON.parse(request.body.read)

    def payment_amount
      if @cart_total > 50
        return (@cart_total * 100).to_i
      else
        return ((@cart_total + 6.50) * 100).to_i
      end
    end

    payment_intent = Stripe::PaymentIntent.create(
      amount: payment_amount,  # Dynamic total from frontend
      currency: 'chf',
      # fields: {
      #   billingDetails: "required",
      #   shippingDetails: "auto",
      # }
    )

    render json: { clientSecret: payment_intent.client_secret }

  end
end
