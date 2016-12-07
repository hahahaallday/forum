class QuestionAnswersController < ApplicationController
	before_action :find_question

  def index
    @answers = @question.answers
  end

  def show
    @answer = @question.answers.find( params[:id] )
  end

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build( answer_params )
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "answer was successfully created"
      redirect_to question_url( @question )
    else
      render :action => :new
    end
  end

  def edit
    @answer = @question.answers.find( params[:id] )
  end

  def update
    @answer = @question.answers.find( params[:id] )
    if @answer.update( answer_params )
      flash[:notice] = "answer was successfully updated"
      redirect_to question_url( @question)
    else
      render :action => :edit
    end
  end

  def destroy
    @answer = @question.answers.find( params[:id] )
    @answer.destroy 
    flash[:alert] = "question was successfully deleted"
    # redirect_to question_url( @question )

    #@like =nil
    respond_to do |format| 
      # format.html{question_path(@question)}
      format.js {render"destroy.js.erb"}     
    end 
  end

  protected

  def find_question
    @question = Question.find( params[:question_id] )
  end

  def answer_params
  	params.require(:answer).permit(:content, :photo)
  end
end
