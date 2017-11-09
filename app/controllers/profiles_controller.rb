class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_set, except: [:new,:create]

  def show

    # show or five for comment
    @comment_over_five = false
    @comment_view_all =false

    @comments = @profile.user.comments.order(created_at: :desc)

    if @comments.count > 5
      @comments = @profile.user.comments[-5..-1]
      @comments.reverse!
      @comment_over_five = true
      if params[:comment_all] == "true"
        @comments = @profile.user.comments.order(created_at: :desc)
        @comment_view_all = true
      elsif params[:comment_all] == "false"
        @comments = @profile.user.comments[-5..-1]
        @comments.reverse!
        @comment_view_all = false
      end

    end

    # show or five for items
    @items_over_five = false
    @items_view_all =false

    @items = @profile.user.items.order(created_at: :desc)

    if @items.count > 5
      @items = @profile.user.items[-5..-1]
      @items.reverse!
      @items_over_five = true
      if params[:items_all] == "true"
        @items = @profile.user.items.order(created_at: :desc)
        @items_view_all = true
      elsif params[:items_all] == "false"
        @items = @profile.user.items[-5..-1]
        @items.reverse!
        @items_view_all = false
      end
    end

    @comment = Comment.new

  end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to items_path
    else
      render "new"
    end

  end

  def update
    authorize @profile

    if @profile.update(profile_params)
      redirect_to @profile
    else
      flash[:profile_error] = "Please enter all info"
      redirect_to @profile
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :image, :nationality, :city)
  end

  def profile_set
    @profile = Profile.find(params[:id])
  end
end
