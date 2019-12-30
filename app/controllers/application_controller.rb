class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if verify_locale(params[:locale])
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale] && I18n.locale != cookies[:locale]
      I18n.locale = cookies[:locale]
    end
  end

  def verify_locale(locale = nil)
    ['pt-BR', 'en'].include?(locale) && locale ? true : false
  end
end
