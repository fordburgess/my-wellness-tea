class LineItemsController < ApplicationController
  def create
    chosen_product = Product.find(params[:product_id])

    if @current_cart.products.include?(chosen_product)
      logger.debug "Cart already contains item"
      # Find the line_item with the chosen_product
      @line_item = @current_cart.line_items.find_by(:product_id => chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = @current_cart
      @line_item.product = chosen_product

      logger.debug "New Line Item created"
    end

    # Save and redirect to cart show path
    @line_item.save
    # redirect_to cart_path(current_cart)
    redirect_to request.referrer
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    @current_cart = @line_item.cart

    if request.referer&.include?("cart") || request.path.include?("cart")
      if @current_cart.line_items.length == 0
        redirect_to teas_path
      else
        redirect_to request.referrer
      end
    else
      if @current_cart.line_items.length == 0
        redirect_to request.referrer
      else
        render turbo_stream:
          turbo_stream.remove("line_item_#{params[:id]}")
      end
    end
      # turbo_stream.replace("cart_items",
      #   partial: "shared/cart_drawer",
      # )
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save

    if request.referer&.include?("cart") || request.path.include?("cart")
      redirect_to request.referrer
    else
      render turbo_stream:
        turbo_stream.replace("line_item_#{@line_item.id}_quantity",
          partial: "partials/quantity", locals: { line_item: @line_item }
        )
    end
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    @current_cart = @line_item.cart

    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save

      if request.referer&.include?("cart") || request.path.include?("cart")
        redirect_to request.referrer
      else
        render turbo_stream:
          turbo_stream.replace("line_item_#{@line_item.id}_quantity",
            partial: "partials/quantity", locals: { line_item: @line_item }
          )
      end
    else
      @line_item.destroy
      if request.referer&.include?("cart") || request.path.include?("cart")
        redirect_to teas_path
      else
        redirect_to request.referrer
      end
    end
  end

  private
    def line_item_params
      params.require(:line_item).permit(:quantity, :product_id, :cart_id)
    end
end
