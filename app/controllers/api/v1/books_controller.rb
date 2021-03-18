class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.all
    render json: @books
  end

  # GET /books/:id
  def show
    @book = find_book
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render error: { error: 'Unable to create Book.' }, status: 400
    end
  end

  # PUT /books/:id
  def update
    @book = find_book
    if @book
      @book.update(book_params)
      render json: { message: 'Book successfully updated' }, status: 200
    else
      render error: { error: 'Unable to update Book.' }, status: 400
    end
  end

  # DELETE /books/:id
  def destroy
    @book = find_book
    if @book
      @book.destroy
      render json: { message: 'Book successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete Book.' }, status: 400
    end
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :author, :year, :status, :genre)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
