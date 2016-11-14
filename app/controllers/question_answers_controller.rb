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
    redirect_to question_answers_url( @question )
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
    redirect_to question_answers_url( @question)
  else
    render :action => :edit
  end

end

def destroy
  @answer = @question.answers.find( params[:id] )
  @answer.destroy

  redirect_to question_answers_url( @question )
end

protected

def find_question

  @question = Question.find( params[:question_id] )
end

def answer_params
	params.require(:answer).permit(:content)
end
end
