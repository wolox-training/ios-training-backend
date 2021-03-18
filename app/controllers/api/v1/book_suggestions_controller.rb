class Api::V1::BookSuggestionsController < ApplicationController
  before_action :find_book_suggestion, only: [:show, :update, :destroy]

  # GET /book_suggestions
  # GET /book/:book_id/book_suggestions
  def index
    if params[:book_id]
      @book_suggestions = find_book.book_suggestions
      render json: @book_suggestions
    else
      @book_suggestions = BookSuggestion.all
      render json: @book_suggestions
    end
  end

  # GET /book_suggestions/:id
  def show
    @book_suggestion = find_book_suggestion
    render json: @book_suggestion
  end

  # POST /book_suggestions
  def create
    @book_suggestion = BookSuggestion.new(book_suggestion_params)
    if @book_suggestion.save
      render json: @book_suggestion
    else
      render error: { error: 'Unable to create BookSuggestion.' }, status: 400
    end
  end

  # PUT /book_suggestions/:id
  def update
    @book_suggestion = find_book_suggestion
    if @book_suggestion
      @book_suggestion.update(book_suggestion_params)
      render json: { message: 'BookSuggestion successfully updated' }, status: 200
    else
      render error: { error: 'Unable to update BookSuggestion.' }, status: 400
    end
  end

  # DELETE /book_suggestions/:id
  def destroy
    @book_suggestion = find_book_suggestion
    if @book_suggestion
      @book_suggestion.destroy
      render json: { message: 'BookSuggestion successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete BookSuggestion.' }, status: 400
    end
  end

  private

  def book_suggestion_params
    params.require(:book_suggestion).permit(:book_id, :image, :title, :author, :year, :status, :genre)
  end

  def find_book_suggestion
    @book_suggestion = BookSuggestion.find(params[:id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

end
