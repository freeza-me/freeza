module ApplicationHelper

  LOCALE_READABLE = {
    ja: '日本語',
    en: 'English'
  }

  def available_locales_with_readable
    I18n.available_locales.map do |locale|
      [ LOCALE_READABLE[locale.to_sym], locale ]
    end
  end

end
