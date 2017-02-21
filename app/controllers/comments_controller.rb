class CommentsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @comments = @question.comments
  end

  def new
    @questions.comments.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = question.comments.update(comment_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to question_path(@question)
  end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
