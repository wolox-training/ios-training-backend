class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :destroy]

  # GET /comments
  # GET /users/:user_id/comments
  # GET /books/:book_id/comments
  def index
    if params[:user_id]
      @comments = find_user.comments
      render json: @comments
    elsif params[:book_id]
        @comments = find_book.comments
        render json: @comments
    else
      @comments = Comment.all
      render json: @comments
    end
  end

  # GET /comments/:id
  def show
    @comment = find_comment
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render error: { error: 'Unable to create Comment.' }, status: 400
    end
  end

  # PUT /comments/:id
  def update
    @comment = find_comment
    if @comment
      @comment.update(comment_params)
      render json: { message: 'Comment successfully updated' }, status: 200
    else
      render error: { error: 'Unable to update Comment.' }, status: 400
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment = find_comment
    if @comment
      @comment.destroy
      render json: { message: 'Comment successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete Comment.' }, status: 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :book_id, :content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

end
