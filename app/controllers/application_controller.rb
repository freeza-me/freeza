class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def set_locale
    if cookies[:locale]
      set_locale_from_cookie
    else
      set_locale_from_accept_language
    end
  end

  private

  def set_locale_safety locale
    if I18n.available_locales.map(&:to_s).include? locale.to_s
      I18n.locale = locale.to_sym
    end
  end

  def set_locale_from_cookie
    set_locale_safety cookies[:locale]
  end

  def set_locale_from_accept_language
    set_locale_safety extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
  end
end
