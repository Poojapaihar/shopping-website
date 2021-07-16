class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	helper_method :require_user

	def after_sign_in_path_for(resource)
	  	products_path
	end

	def require_user
		if !user_signed_in?
			flash[:alert] = "You must be logged in to perform that action"
			redirect_to new_user_session_path
		end
	end

	protected

		def configure_permitted_parameters
		  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
		    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
		end

end
