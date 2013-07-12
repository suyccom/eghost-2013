class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  def set_locale
    if params[:locale]
      session[:locale] = params[:locale]
      current_user.update_attribute(:language, params[:locale])
    end
    session[:locale] ||= current_user.language if current_user.signed_up?
    I18n.locale = session[:locale]
  end

end
