class LocaleController < ApplicationController
  def update
    cookies[:locale] = params[:locale]
    render json: { status: :success }
  end
end
