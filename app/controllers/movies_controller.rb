class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movvies
  def index
    @movies = Movie.all

    render json: @movies
  end

  # GET /movvies/1
  def show
    render json: @movy
  end

  # POST /movvies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movvies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movvies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit([
        :title,
        :description,
        covers_attributes: %I[
          id
          photo
          _destroy
          ]
        ])
    end
end
