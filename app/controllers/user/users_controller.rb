class User::UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :user_profile, only: [:update, :update_profile]

  def index    
    @search = User.search(params[:q])
    @users = @search.result.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @last_sales = @user.sale_transactions.order{created_at.desc}.limit(5)
  end

  def new
    @user = User.new
    render json: {html: render_to_string("new", layout: false)}
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @response = {status: :success}
    else
      @response = {status: :error, errors: @user.errors}
    end
    render json: @response
  end

  def edit
    @user =  User.find(params[:id])
    if request.xhr?
      render json: {html: render_to_string("admin_edit", layout: false)}
    end
  end

  def update
    if @user.update_attributes(params[:user])
      @response = {status: :success}
    else
      @response = {status: :error, errors: @user.errors}
    end
    render json: @response
  end

  def update_profile
    if @user.update_attributes(params[:user])
      flash[:success] = "Has actualizado tu perfil de forma correcta."
      redirect_to edit_user_path(@user)
    else
      flash[:error] = "Hay errores actualizando tu perfil."
      render :edit
    end
  end

  private

  def user_profile
     params[:user].delete_if{|key, value| value.blank?}
     @user = User.find(params[:id])
  end

end
