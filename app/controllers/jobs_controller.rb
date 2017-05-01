class JobsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy, :join, :quit]

  def show
    @job = Job.find(params[:id])
    @user = @job.user

    @category = @job.category
    # 随机推荐5个相同类型的职位（去除当前职位） #
    @sames = Job.where(:is_hidden => false, :category => @job.category).where.not(:id => @job.id ).random5
    # 搜索该用户投递此职位的简历数量 #
    @resumes = Resume.where(:job => @job, :user => current_user)

    if @job.is_hidden
      flash[:warning] = "该项目已归档！"
      redirect_to root_path
    end
    @posts = @job.posts.recent.paginate(:page => params[:page], :per_page => 10)
  end

  def index

    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      current_user.join!(@job)
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

  def developer
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "developer").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def healthcare
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs =  Job.published.where(:category => "healthcare").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def customer_service
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "customer-service").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def sales_marketing
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "sales-marketing").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def legal
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "legal").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def non_profit
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "non-profit").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def human_resource
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "human-resource").recent.paginate(:page => params[:page], :per_page => 5)
  end

  def design
    # 随机推荐五个职位 #
    @suggests = Job.published.random5
    @jobs = Job.published.where(:category => "design").recent.paginate(:page => params[:page], :per_page => 5)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :city, :company, :category,:is_hidden)
  end

end
