class Account::AttentionJobsController < ApplicationController
  before_action :logged_in_user

  def index
    @jobs = current_user.participated_jobs
  end
end
