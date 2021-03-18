class Api::V1::WishesController < ApplicationController
  before_action :find_wish, only: [:show, :update, :destroy]

  # GET /wishes
  # GET /users/:user_id/wishes
  # GET /books/:book_id/wishes
  def index
    if params[:user_id]
      @wishes = find_user.wishes
      render json: @wishes
    elsif params[:book_id]
      @wishes = find_book.wishes
      render json: @wishes
    else
      @wishes = Wish.all
      render json: @wishes
    end
  end

  # GET /wishes/:id
  def show
    @wish = find_wish
    render json: @wish
  end

  # POST /wishes
  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      render json: @wish
    else
      render error: { error: 'Unable to create Wish.' }, status: 400
    end
  end

  # PUT /wishes/:id
  def update
    @wish = find_wish
    if @wish
      @wish.update(wish_params)
      render json: { message: 'Wish successfully updated' }, status: 200
    else
      render error: { error: 'Unable to update Wish.' }, status: 400
    end
  end

  # DELETE /wishes/:id
  def destroy
    @wish = find_wish
    if @wish
      @wish.destroy
      render json: { message: 'Wish successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete Wish.' }, status: 400
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:user_id, :book_id)
  end

  def find_wish
    @wish = Wish.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
