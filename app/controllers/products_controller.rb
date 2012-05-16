class ProductsController < ApplicationController

  respond_to :json, only: [:new]

  def index
  end

  def new
    @product = Product.new
    respond_with(html: render_to_string("new", layout: false))
  end

end
