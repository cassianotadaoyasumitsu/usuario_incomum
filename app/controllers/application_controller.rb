class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
   if params[:locale]
     cookies[:locale] = params[:locale]
   end
   if cookies[:locale]
     if I18n.locale != cookies[:locale]
       I18n.locale = cookies[:locale]
     end
   end
 end

 private

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture, :kind])
end


end
