class Api::V1::RepositoriesController < ApplicationController
  def index
    render json: Repository.all
  end
end
