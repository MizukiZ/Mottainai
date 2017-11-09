class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_validation


  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = current_user
    @comment.recipient = Profile.find(params[:profile_id]).user
    if @comment.save
      redirect_to Profile.find(params[:profile_id])
    else
      flash[:alert] = "Can not be blank"
      redirect_to Profile.find(params[:profile_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to Profile.find(params[:profile_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def comment_set
    @comments = Profile.find(params[:profile_id]).user.comments
  end

  def profile_validation
    if !current_user.has_profile?
      redirect_to new_profile_path
      flash[:notice] = "Please enter your details to continue"
    end
  end

end
