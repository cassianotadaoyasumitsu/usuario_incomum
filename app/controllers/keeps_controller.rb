class KeepsController < ApplicationController
  before_action :find_user, except: [:destroy]

  def index
    @keeps = Keep.where(user_id:"#{@user.id}").all
  end

  def destroy
    @keep = Keep.find(params[:id])
    @keep.destroy
    redirect_to user_keeps_path
  end

  private

  # def keep_params
  #   params.require(:keep).permit(:user_id,:post_id)
  # end

  def find_user
    @user = User.find(params[:user_id])
  end

end
