class ApplicationController < ActionController::Base
  around_action :switch_locale
  #before_action :authenticate_user!, except: %i[show index home]
  private
  # app/controllers/application_controller.rb
  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

end
