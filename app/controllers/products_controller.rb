class ProductsController < ApplicationController
  def show
  	@user = current_user
  	@product = Product.find(params[:id])

  end

  def index
  	@products = Product.paginate(page: params[:page], per_page: 10)

  end
end
