class EmailRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @email_requests = policy_scope(EmailRequest)
  end

  def new
    @email_request = EmailRequest.new
    authorize @email_request
  end

  def create
    @email_request = EmailRequest.new(email_request_params)
    @email_request.save
    authorize @email_request
    raise
    redirect_to unauthenticated_root_path
  end

  private

  def email_request_params
    params.require(:email_request).permit(:email,:content)
  end

end
