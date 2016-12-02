class SubscribesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_question
	def create
		@subscribe = Subscribe.new(:user =>current_user, :question => @question)

		if @subscribe.save
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
		@subscribe = Subscribe.find(params[:id])
		@subscribe.destroy

		@subscribe =nil
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
