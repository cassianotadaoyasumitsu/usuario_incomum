class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.all
    @posts = Post.top.limit(3)
    redirect_to posts_path(search: params['search']) if params['search'].present?
  end
end
