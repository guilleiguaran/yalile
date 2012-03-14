class User::SessionsController < Devise::SessionsController

  def new
  end

  def create
    @user = User.find_user(params[:user])
    if @user.nil?
      flash[:error] = "error"
    else
      sign_in(@user)
    end
    redirect_to new_user_session_path
  end

end
