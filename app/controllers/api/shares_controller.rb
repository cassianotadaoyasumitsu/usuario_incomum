module Api
  class SharesController < ActionController::API
    def index
      render json: Share.filter_by_post(params[:post_id]).select(:id, :post_id)
    end

    def create
      Share.create!(shares_params)
      head :created
    end

    private

    def shares_params
      params.require(:share).permit(:post_id)
    end
  end
end
