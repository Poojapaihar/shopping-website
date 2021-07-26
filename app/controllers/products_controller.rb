class ProductsController < ApplicationController
  def show
  	@user = current_user
  	@product = Product.find(params[:id])
  end

  def index
  	@products = Product.paginate(page: params[:page], per_page: 10)
  end

  def like
  	@product = Product.find(params[:id])
  	Like.create(user_id: current_user.id, product_id: @product.id)
  	redirect_to product_path(@product)
  end
end
