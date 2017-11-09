class PostsController < ApplicationController
  before_action :authenticate_user!


  # kaminari
  PER = 5

  def index
    @posts = Item.where(user: current_user).order(created_at: :desc).page(params[:page]).per(PER)
  end
end
