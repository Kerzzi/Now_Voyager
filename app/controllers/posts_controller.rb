class PostsController < ApplicationController

  before_action :logged_in_user, :only => [:new, :create]

  def new
    @job = Job.find(params[:job_id])
    @post = Post.new
  end

  def create
    @job = Job.find(params[:job_id])
    @post = Post.new(post_params)
    @post.job = @job
    @post.user = current_user

    if @post.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
