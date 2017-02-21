class CommentsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @comments = @question.comments
  end

  def new
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new
    respond_to do |format|
      format.html {redirect_to comment_path}
      format.js
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @question.save
      respond_to do |format|
        format.html {redirect_to questions_path}
        format.js
      end
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
