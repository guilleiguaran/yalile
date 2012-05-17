class ProductsController < ApplicationController

  before_filter :load_products, only: [:new]

  respond_to :json, only: [:new]

  def index
  end

  def new
    @product = Product.new
    @product.articles.build
    respond_with(html: render_to_string("new", layout: false))
  end

  private

  def load_products
    @products = Product.all
  end

end
