class TagsController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@tag = Tag.new(tag_params)
	  if @tag.save
	    flash[:notice] = "tag was successfully created"
	    @question.question_tagships.create(:tag_id => @tag.id)
	    redirect_to question_path(@question)
	  else
	    render :action => :new
  	end
  end	

	protected

  def tag_params
      params.require( :tag ).permit( :name )
  end 
  
end
