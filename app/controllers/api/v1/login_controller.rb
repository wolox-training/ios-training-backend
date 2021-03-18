class Api::V1::LoginController < ApplicationController

  def index
    render json: { message: 'Logged in!' }, status: 200
  end

end
