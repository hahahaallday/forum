class UsersController < ApplicationController
	

	def profile
		@user = current_user
		@questions = @user.questions
		@answers = @user.answers
	end

	def user_profile
		@user = User.find( params[:id] )
	end	

	def update
	    @user = User.find( params[:id] )
	    if @user.update( user_params )
	      flash[:notice] = "nickname was successfully updated"
	      redirect_to profile_users_url( @question)
	    else
	      render :action => :profile
	    end
  	end

  private 

  	#api/users
	def user_params
		params.require( :user ).permit( :nickname)
	end	 	

end
