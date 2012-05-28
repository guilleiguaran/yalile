class User::SessionsController < Devise::SessionsController

  def new
  end

  def create
    @user = User.find_user(params[:user])
    if @user.nil?
      flash[:error] = "Usuario o Contrasena invalida"
      render :new
    else
      sign_in(@user)
      redirect_to products_path
    end
  end
  
  def destroy
    sign_out(current_user)
    redirect_to root_path
  end

end
