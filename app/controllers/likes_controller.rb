class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_question
	def create
		@like = Like.new(:user =>current_user, :question => @question)

		if @like.save
			flash[:notice]= "Succeed!"
		else
			flash[:alert] = "Fail"	
		end

		respond_to do |format| 
			format.html{question_path(@question)}
			format.js
		end	
	end

	def destroy
		@like = Like.find(params[:id])
		@like.destroy

		@like =nil
		respond_to do |format| 
			format.html{question_path(@question)}
			format.js {render"create.js.erb"}			
		end	
	end	

	private 

	def set_question
		@question =Question.find_by_id(params[:question_id])
	end	
end
