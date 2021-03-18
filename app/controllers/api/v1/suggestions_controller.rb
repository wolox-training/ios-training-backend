class Api::V1::SuggestionsController < ApplicationController
  before_action :find_suggestion, only: [:show, :update, :destroy]

  # GET /suggestions
  # GET /users/:user_id/suggestions
  def index
    if params[:user_id]
      @suggestions = find_user.suggestions
      render json: @suggestions
    else
      @suggestions = Suggestion.all
      render json: @suggestions
    end
  end

  # GET /suggestions/:id
  def show
    @suggestion = find_suggestion
    render json: @suggestion
  end

  # POST /suggestions
  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      render json: @suggestion
    else
      render error: { error: 'Unable to create Suggestion.' }, status: 400
    end
  end

  # PUT /suggestions/:id
  def update
    @suggestion = find_suggestion
    if @suggestion
      @suggestion.update(suggestion_params)
      render json: { message: 'Suggestion successfully updated' }, status: 200
    else
      render error: { error: 'Unable to update Suggestion.' }, status: 400
    end
  end

  # DELETE /suggestions/:id
  def destroy
    @suggestion = find_suggestion
    if @suggestion
      @suggestion.destroy
      render json: { message: 'Suggestion successfully deleted' }, status: 200
    else
      render error: { error: 'Unable to delete Suggestion.' }, status: 400
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:user_id, :link, :title, :author)
  end

  def find_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
