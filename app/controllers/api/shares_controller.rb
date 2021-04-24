class Api::SharesController < ActionController::API
  before_action :authenticate_user!

  def index
    render json: Share.filter_by_post(params[:post_id]).select(:id, :user_id, :post_id)
  end

  def create
    current_user.shares.create!(shares_params)
    head :created
  end

  def destroy
    current_user.shares.find(params[:id]).destroy!
    head :ok
  end

  private

  def shares_params
    params.require(:share).permit(:post_id)
  end
end
