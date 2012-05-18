class ProductsController < ApplicationController

  before_filter :load_products, only: [:new]
  before_filter :check_product_existence, :only => [:create]

  respond_to :json, only: [:new, :create]

  def index
  end

  def new
    @product = Product.new
    @product.articles.build
    respond_with(html: render_to_string("new", layout: false))
  end

  def create
    respond_with(@product) do |format|
      if @product.save
        format.json { render json: {status: "success"}}
      else
        format.json { render json: {status: "error", errors: @product.errors.messages}}
      end
    end
  end

  private

  def load_products
    @products = Product.all
  end

  def check_product_existence
    @product = Product.find_by_id(params[:product].delete(:code))
    if @product.nil?
      @product = Product.new(params[:product])
    else
      @product.articles_attributes = params[:product][:articles_attributes]
    end
  end

end
