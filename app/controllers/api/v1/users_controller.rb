class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users =  policy_scope(User)
  end

  def show
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(restaurant_params)
    authorize @user
    if @user.save
      render :show, status: :created
    else
      render_error
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
      render :edit
    else
      render_error
    end
  end

  def destroy
    @restaurant.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :gender, :age, :kind, :address, :phone, :prefecture, :nihongo, :note, :work, :extra)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end

end
