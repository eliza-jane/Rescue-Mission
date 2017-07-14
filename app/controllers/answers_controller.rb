class AnswersController < ApplicationController

  # def new
  #   @question = Question.find(params[:question_id])
  #   @answer = Answer.new
  # end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      flash[:notice] = 'Answer was successfully created.'
      redirect_to question_path(@question)
    else
      render action: 'new'
    end
  end


  private

  def user_id_from_params
    User.find_by(username: params[:answer][:user]).id
  end

  def question_id_from_params
    Question.find(params[:question_id]).id
  end

  def answer_params
    params.require(:answer).permit(:body).merge(user_id: user_id_from_params, question_id: question_id_from_params)
  end
end
