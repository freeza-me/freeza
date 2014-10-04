class ApplicationController < ActionController::Base
  responders :location, :flash, :http_cache
  respond_to :html, :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def set_locale
    set_locale_safety extract_locale
  end

  private

  def set_locale_safety locale
    if I18n.available_locales.map(&:to_s).include? locale.to_s
      I18n.locale = locale.to_sym
    end
  end

  def extract_locale
    if current_user && current_user.locale
      current_user.locale
    elsif cookies[:locale]
      extract_locale_from_cookie
    else
      extract_locale_from_accept_language
    end
  end

  def extract_locale_from_cookie
    cookies[:locale]
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
  end
end
