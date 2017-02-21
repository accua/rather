class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to user_questions_path
    else
      render :new
    end
  end

  def index
    @questions = Question.all
    if (params[:like])
      choice_a = Question.find(params[:like])
      current_user.likes choice_a
    end
    if (params[:dislike])
      choice_b = Question.find(params[:dislike])
      current_user.dislikes choice_b
    end
  end

  def upvote

  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    respond_to do |format|
      format.html {redirect_to user_questions_path}
      format.js
    end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to user_questions_path
  end

private
  def question_params
    params.require(:question).permit(:content, :choice_a, :choice_b, :user_id, :tags)
  end
end
