class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_questions, :only =>[ :show, :edit, :update, :destroy ,:user_profile ]
	before_action :question_value, :only => [:index]
	def index
		if params[:category_ids]
		 	array = question_categoryship.where(:category_id =>params[:category_ids]).collect{|category_id| category_id[:question_id]}.uniq 
		 	byebug
		 	@questions = Question.where(:id => array).page(params[:page]).per(5)
		else  @questions = Question.page(params[:page]).per(5)
		end
		# @questions =Question.all
		case params[:order]
        when "Update"
           sort_by = "answers.created_at"
        when "Reply"
           sort_by = "answers_count"
        when "created_at"
        end

        @questions = Question.includes(:answers , :user, :categories).order(sort_by).reverse_order.page(params[:page]).per(5)
   		@categories = Category.all
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
		@categories = Category.all 
			render 'index'	
		end	
	end

	def show
		@page_title = @question.topic
		@answers = @question.answers
		if params[:edit_answer]
			@answer = @question.answers.find([params[:edit_answer]])
		else
			@answer = Answer.new
		end	
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
		flash[:alert] = "question was successfully deleted"
		redirect_to questions_url
	end 

	def about
		@users = User.all
		@questions = Question.all
		@answers = Answer.all
	end

	def profile
		@user = current_user
		@questions = @user.answers
		@answers = @user.answers
	end

	def user_profile
		@user = @question.user
	end	

	private
	
	def question_params
		params.require( :question ).permit( :topic, :description, :category_id,  :category_ids => [] )
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
