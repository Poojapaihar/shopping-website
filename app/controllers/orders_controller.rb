class OrdersController < ApplicationController


	def create

		@user = current_user
		
		@product = Product.find(params[:product_id])

		@order = @product.orders.create(order_params)

		@quantity = (@product.quantity)-1

		@product_update = @product.update(quantity: @quantity)

		flash[:notice] = "Order has been placed successfully!"

		redirect_to cards_path
		
	end


	private

	def order_params
		params.require(:order).permit(:product_id, :user_id, :quantity)
	end

end
