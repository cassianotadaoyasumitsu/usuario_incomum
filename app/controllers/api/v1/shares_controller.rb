class Api::V1::SharesController < Api::V1::BaseController

  def index
    render json: policy_scope(Share).filter_by_post(params[:post_id]).select(:id, :post_id)
  end

  def create
    @share = policy_scope(Share).create!(shares_params)
    authorize @share
    head :created
  end

  private

  def shares_params
    params.require(:share).permit(:post_id)
  end
end
