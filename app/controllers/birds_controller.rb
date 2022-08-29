class BirdsController < ApplicationController

  def increment_likes
    bird = Bird.find_by(id: params[:id])
    bird.update(likes: bird.likes + 1)
    render json: bird
  end

  def update
    bird = Bird.find_by(id: params[:id])
    bird.update(bird_params)
    render json: bird
  end

  def index
    birds = Bird.all
    render json: birds
  end

  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end