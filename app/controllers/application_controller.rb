class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :birthday, :family, :first, :family_kana, :first_kana, addresses_attributes:[:post_code, :prefecture_id, :city, :block_number, :building_name, :tel, :user_id]])

    # devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :birthday, :family, :first, :family_kana, :first_kana[:post_code, :prefecture_id, :city, :block_number, :building_name, :tel, :user_id]])
  end
end

# class ApplicationController < ActionController::Base
#   before_action :basic_auth
#   before_action :basic_auth, if: :production?
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  def production?
    Rails.env.production?
  end
# end
