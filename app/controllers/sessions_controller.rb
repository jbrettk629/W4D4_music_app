class SessionsController < ApplicationController
  
  def new
    
  end 
  
  def create 
    @user = User.find_by_credentials(
          params[:user][:email],
          params[:user][:password])
    
    if @user 
      login(@user)
      redirect_to user_url(@user)
    else 
      flash[:errors] = "Your credentials are incorrect, try again"
      redirect_to new_session_url 
    end 
  end 
  
  def destroy 
    logout
    redirect_to new_session_url
  end 
  
  def session_params
    params.require(:user).permit(:email, :password)
  end  
    
  
  
end
