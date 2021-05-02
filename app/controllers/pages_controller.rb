class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.all
    @posts = Post.all.order('created_at DESC').limit(9)
    if params['search'].present?
      redirect_to posts_path(search: params['search'])
    end
  end
end
