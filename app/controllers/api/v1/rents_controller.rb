class Api::V1::RentsController < ApplicationController
  before_action :find_rent, only: [:show, :update, :destroy]

  # GET /rents
  # GET /users/:user_id/rents
  # GET /books/:book_id/rents
  def index
    if params[:user_id]
      @rents = find_user.rents
      render json: @rents
    elsif params[:book_id]
      @rents = find_book.rents
      render json: @rents
    else
      @rents = Rent.all
      render json: @rents
    end
  end

  # GET /rents/:id
  def show
    @rent = find_rent
    render json: @rent
  end

  # POST /rents
  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      render json: @rent
    else
      render error: { error: 'Unable to create Rent.' }, status: 400
    end
  end

  # PUT /rents/:id
  def update
    @rent = find_rent
    if @rent
      @rent.update(rent_params)
      render json: { message: 'Rent successfully updated' }, status: 200
    else
      render error: { error: 'Unable to update Rent.' }, status: 400
    end
  end

  # DELETE /rents/:id
  def destroy
    @rent = find_rent
    if @rent
      @rent.destroy
      render json: { message: 'Rent successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete Rent.' }, status: 400
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end

  def find_rent
    @rent = Rent.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

end
