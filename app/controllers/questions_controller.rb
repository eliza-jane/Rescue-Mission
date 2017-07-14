class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question was successfully updated.'
      redirect_to @question
    else
      render action: 'edit'
    end
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Question was successfully created.'
      redirect_to @question
    else
      render action: 'new'
    end
  end

  def destroy
    @question=Question.find(params[:id])
    if @question.destroy!
      redirect_to questions_path
    end
  end


  private

  def user_id_from_params
    User.find_by(username: params[:question][:user]).id
  end

  def question_params
    params.require(:question).permit(:title, :body).merge(user_id: user_id_from_params)
  end

end
