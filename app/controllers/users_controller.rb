class UsersController < ApplicationController

	def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
    	# log_in @user
  		flash[:success] = "Success! You can now check-in by clicking on the check-in link above."
  		redirect_to @user # Handle a successful save.
  	else
  		render 'new'
  	end
  end


	  private
	  	def user_params
	  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  	end
end
