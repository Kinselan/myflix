class VideosController < ApplicationController
  before_action :require_user

  def index
    @categories = Category.allg
  end

  def show
    @video = Video.find(params[:id])
    @reviews = @video.reviews
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end
end
