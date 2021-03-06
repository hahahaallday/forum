class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_questions, :only =>[ :show, :edit, :update, :destroy ,:user_profile ]
	before_action :question_value, :only => [:index]
	def index
		# @questions =Question.all
		@tag = Tag.new
		@tags = Tag.all

		case params[:order]
      when "Update"
         sort_by = "answers.created_at DESC"
      when "Reply"
         sort_by = "answers_count DESC"
      when "created_at"
    end

    @questions = Question.includes(:answers , :user, :categories, :tags).order(sort_by).page(params[:page]).per(5)
   	@categories = Category.all
 

   	if params[:keyword]
			@search_by = params[:keyword]
			@questions = Question.includes(:answers , :user, :categories).where('categories.id'=> @search_by).order(sort_by).page(params[:page]).per(5)
		end

		if params[:tagkey]
			@tag_by = params[:tagkey]
			@questions = Question.includes(:answers , :user, :tags).where('tags.name'=> @tag_by).order(sort_by).page(params[:page]).per(5)
		end
	end


	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.user = current_user
		@tag = params['question']['point'].split(/#/)
		@tag.shift
		if @question.save
			flash[:notice] = "question was successfully created"
			@tag.each do |tag|
				@split_tag = Tag.create(:name => tag.rstrip)
				@question.question_tagships.create(:tag_id => @split_tag.id)
			end	
			redirect_to questions_url
		else
			@questions = Question.includes(:answers , :user, :categories).page(params[:page]).per(5)
   		@categories = Category.all 
			render 'index'	
		end	
	end

	def show
		@page_title = @question.topic
		@answers = @question.answers
		# TODO Find the answer if given answer_id
		@answer = Answer.new
		@like = current_user.likes.find_by_question_id(@question) 
		@subscribe = current_user.subscribes.find_by_question_id(@question) 
		@tag = Tag.new
		@tags = Tag.all
		@questions = Question.includes(:answers , :user, :tags).where('tags.name'=> @tag.name).page(params[:page]).per(5)
	end
	
	def edit		
		@categories = Category.all 
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
		@users_count = User.count
		@questions_count = Question.count
		@answers_count = Answer.count
	end

	private
	
	def question_params
		params.require( :question ).permit( :topic, :description, :category_id , :photo,:category_ids => [],:tag_ids => [])
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
