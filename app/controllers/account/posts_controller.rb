class Account::PostsController < ApplicationController
  before_action :logged_in_user
  def index
    @posts = current_user.posts
  end
end
