class KeepsController < ApplicationController
  before_action :find_user, except: [:destroy]

  def index
    @keeps = policy_scope(Keep).where(user_id: @user.id.to_s).all
    @posts = "keep_data"
  end

  def destroy
    @keep = Keep.find(params[:id])
    authorize @keep
    @keep.destroy
    redirect_to user_keeps_path
  end

  private

  # def keep_params
  #   params.require(:keep).permit(:user_id,:post_id)
  # end

  def find_user
    @user = User.find(params[:user_id])
    authorize(@user, :new?)
  end
end
