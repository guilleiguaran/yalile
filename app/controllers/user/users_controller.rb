class User::UsersController < ApplicationController

  def index    
    @users = User.where{}.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render json: {html: render_to_string("new", layout: false)}
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:sucess] = "El usuario se guardo correctamente."
    else
      flash[:error] = "El usuario no se guardo de forma correcta intente nuevamente."
    end
    redirect_to new_user_path
  end

  def edit
    @user =  User.find(params[:id])
    render json: {html: render_to_string("edit", layout: false)}
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      @response = {status: :success}
    else
      @response = {status: :error, errors: @user.errors.messages}
    end
    render json: @response
  end

end
