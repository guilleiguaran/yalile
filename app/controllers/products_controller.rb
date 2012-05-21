class ProductsController < ApplicationController

  before_filter :load_products, only: [:new]
  before_filter :check_product_existence, :only => [:create]

  respond_to :json, only: [:new, :create]

  def index
    @products = Product.order{created_at.desc}.page(params[:page])
  end

  def new
    @product = Product.new
    @product.articles.build
    respond_with(html: render_to_string("new", layout: false))
  end

  def create
    respond_with(@product) do |format|
      format.json do
        if @product.save
          render json: {status: "success"}
        else
          render json: {status: "error", errors: @product.errors}
        end
      end
    end
  end

  private

  def load_products
    @products = Product.all
  end

  def check_product_existence
    @product = Product.by_id_or_name(params[:product])
    params[:product].delete(:code)
    if @product.nil?
      @product = Product.new(params[:product])
    else
      @product.articles_attributes = params[:product][:articles_attributes]
    end
  end

end
