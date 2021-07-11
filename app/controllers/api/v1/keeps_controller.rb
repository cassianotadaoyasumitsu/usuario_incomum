class Api::V1::KeepsController < Api::V1::BaseController

  def index
    render json: policy_scope(Keep).filter_by_post(params[:post_id]).select(:id, :user_id, :post_id)
  end

  def create
    @keep = current_user.keeps.create!(keeps_params)
    authorize @keep
    head :created
  end

  def destroy
    @keep = current_user.keeps.find(params[:id]).destroy!
    authorize @keep
    head :ok
  end

  private

  def keeps_params
    params.require(:keep).permit(:post_id)
  end
end
