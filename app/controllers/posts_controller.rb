class PostsController < ApplicationController
  before_action :find_user, except: [:destroy, :show, :edit, :update, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @search = params['search']
    if @search.present?
      @posts = policy_scope(Post).search_info("#{@search}")
    else
      @posts = policy_scope(Post)
    end
  end

  def show
    @post.punch(request)
    @shares = Share.all
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = @user
    if current_user.kind == "Usuário"
      if current_user.posts.all.size >= 1
        redirect_to authenticated_root_path, notice: 'Você não pode criar mais de 1 post.'
      elsif @post.save
        redirect_to authenticated_root_path
        authorize @post
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

  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to authenticated_root_path
  end

  def user_posted
    @search = params['search']
    if @search.present?
      @posts = Post.where(user_id: "#{@user.id}").search_info("#{@search}")
      authorize @posts
    else
      @posts = Post.where(user_id: "#{@user.id}")
      authorize @posts
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def find_user
    @user = User.find(params[:user_id])
    authorize(@user, :new?)
  end

  def post_params
    params.require(:post).permit(:phone, :title, :service, :company, :contact, :salary, :turn, :prefecture, :address, :description, :value, :note)
  end
end
