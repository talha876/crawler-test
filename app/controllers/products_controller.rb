class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: { products: @products, status: 200 }
  end

  def show
    @product = Product.find_by(id: params[:id])
    render json: { product: @product, status: 200 }
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    if @product.destroy
      render json: { product: @product, status: 200 }
    else
      render json: { product: @product, status: 500, message: "Something Went Wrong" }
    end
  end

end
