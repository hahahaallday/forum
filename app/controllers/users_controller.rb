class UsersController < ApplicationController
	def profile
		@user = current_user
		@questions = @user.questions
		@answers = @user.answers
	end

	def user_profile
		@user = @question.user
	end	
end
