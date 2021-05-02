class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.all
    @posts = Post.top.limit(3)
    if params['search'].present?
      redirect_to posts_path(search: params['search'])
    end
  end
end
