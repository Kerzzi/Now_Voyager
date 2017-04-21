class JobsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy, :join, :quit]

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "该项目已归档！"
      redirect_to root_path
    end
    @posts = @job.posts.recent.paginate(:page => params[:page], :per_page => 20)
  end

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to jobs_path
  end

  #关注项目
  def join
   @job = Job.find(params[:id])

    if !current_user.is_member_of?(@job)
      current_user.join!(@job)
      flash[:notice] = "成功关注该项目！"
    else
      flash[:warning] = "已经关注该项目！"
    end

    redirect_to job_path(@job)
  end

  #取消关注项目
  def quit
    @job = Job.find(params[:id])

    if current_user.is_member_of?(@job)
      current_user.quit!(@job)
      flash[:alert] = "取消关注该项目！"
    else
      flash[:warning] = "未关注该项目！"
    end

    redirect_to job_path(@job)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :city, :company, :category,:is_hidden)
  end

end
