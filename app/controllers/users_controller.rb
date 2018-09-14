class UsersController < ApplicationController
  
  def new
    render :new #default behavior
  end 
  
  def create 
    @user = User.new(user_params)
  
    if @user 
      login(@user)
      redirect_to user_url(@user) #redirect to their page
    else 
      flash.now[:errors] = "Your password is too short, or that email is already taken! Try again!"
      render :new #want to render instead redirect becauser of the flash.now
      #could redirect if I user flash instead of flash.now
    end 
  end 
  
  def show #look at the wildcard id and find the user by that, then render their page... @user gets passed to the view page
    @user = User.find_by(id: params[:id])
    render :show  #render their page, this is a default, not needed to be put
  end 
  
  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end
