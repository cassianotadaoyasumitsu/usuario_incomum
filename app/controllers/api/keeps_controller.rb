module Api
  class KeepsController < ActionController::API
    before_action :authenticate_user!

    def index
      render json: Keep.filter_by_post(params[:post_id]).select(:id, :user_id, :post_id)
    end

    def create
      current_user.keeps.create!(keeps_params)
      head :created
    end

    def destroy
      current_user.keeps.find(params[:id]).destroy!
      head :ok
    end

    private

    def keeps_params
      params.require(:keep).permit(:post_id)
    end
  end
end
