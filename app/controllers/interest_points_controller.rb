class InterestPointsController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@interest_point = Interest_point.new(interest_point_params)
	  if @interest_point.save
	    #flash[:notice] = "tag was successfully created"
	    @question.question_interest_pointships.create(:interest_point_id => @interest_point.id)
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
