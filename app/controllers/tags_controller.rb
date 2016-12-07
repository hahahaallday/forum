class TagsController < ApplicationController
	before_action :authenticate_user!
	before_action :question_value, :only => [:index]
	# def index
	# 	# @questions =Question.all
	# 	@tag = Tag.new
	# 	@tags = Tag.all

	# 	case params[:order]
 #      when "Update"
 #         sort_by = "answers.created_at DESC"
 #      when "Reply"
 #         sort_by = "answers_count DESC"
 #      when "created_at"
 #    end

 #    @questions = Question.includes(:answers , :user, :categories).order(sort_by).page(params[:page]).per(5)
 #   	@categories = Category.all

 # 		if params[:keyword]
	# 		@search_by = params[:keyword]
	# 		@questions = Question.includes(:answers , :user, :categories).where('categories.id'=> @search_by).order(sort_by).page(params[:page]).per(5)
	# 	end
	# end

	def create
		@question = Question.find(params[:question_id])
		@tag = Tag.new(tag_params)
	  if @tag.save
	    flash[:notice] = "tag was successfully created"
	    @question.question_tagships.create(:tag_id => @tag.id)
	    redirect_to question_path(@question)

	    #respond_to do |format| 
      # format.html{question_path(@question)}
      #format.js {render"create.js.erb"}     
    #end 
	  else
	    render :action => :new
  	end
  end	

	protected

  def tag_params
      params.require( :tag ).permit( :name )
  end 

  def question_value
		unless @question 
			@question = Question.new
		end	 	
	end		

end
