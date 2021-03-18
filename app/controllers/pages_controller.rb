class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.all
    @posts = Post.all.where(company: nil)
  end
end
