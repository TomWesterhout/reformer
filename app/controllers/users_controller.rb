class UsersController < ApplicationController
	def new
		@user = User.new
	end

    def create
    	#Instance variable used for the form_tag form and the pre-nested attributes of the classic html form.
    	#@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    	@user = User.new(user_params)
    	if @user.save
    		redirect_to new_user_path
    	else
    		render :new
    	end
    end

    def edit
    	@user = User.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    		redirect_to edit_user_path(@user)
    	else
    		render :edit
    	end
    end

    private
    def user_params
    	params.require(:user).permit(:username, :email, :password)
    end
end
