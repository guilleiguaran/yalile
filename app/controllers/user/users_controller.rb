class User::UsersController < ApplicationController

  def index    
    @users = User.where{}.page(params[:page])
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

end
