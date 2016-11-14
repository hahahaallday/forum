class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_questions, :only =>[ :show, :edit, :update, :destroy]
	before_action :question_value, :only => [:index]
	def index
		@questions =Question.all

	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@questions =Question.all
		@question.user = current_user
		if @question.save
			flash[:notice] = "question was successfully created"
			redirect_to questions_url
		else 
			render :index	
		end	
	end

	def show
		@page_title = @question.topic
	end
	
	def edit		
	end

	def update
		if @question.update(question_params)
			flash[:notice] = "question was successfully updated"
			redirect_to question_url(@question)
		else 
			render :edit 
		end		
	end	

	def destroy
		@question.destroy
		flash[:alert] = "event was successfully deleted"
		redirect_to questions_url
	end 
		
	private
	
	def question_params
		params.require( :question ).permit( :topic, :description, :category_id)
	end	 	

	def set_questions
		@question = Question.find(params[:id])
	end
		
	def question_value
		unless @question 
			@question = Question.new
		end	 	
	end		
end
