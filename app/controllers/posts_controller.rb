class PostsController < ApplicationController
  before_action :find_user, except: [:destroy, :show, :edit, :update, :index]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @search = params['search']
    if @search.present?
      @posts = Post.search_info("#{@search}")
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @post.punch(request)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    if current_user.kind == "Usuário"
      if current_user.posts.all.size >= 1
        redirect_to authenticated_root_path, notice: 'Você não pode criar mais de 1 post.'
      elsif @post.save
        redirect_to authenticated_root_path
      else
        render :new
      end
    else
      if current_user.posts.all.size >= 10
        redirect_to authenticated_root_path, notice: 'Você não pode criar mais posts.'
      elsif @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to authenticated_root_path
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:phone, :title, :service, :company, :contact, :salary, :turn, :prefecture, :address, :description, :value, :note)
  end
end
