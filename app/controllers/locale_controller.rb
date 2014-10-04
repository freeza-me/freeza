class LocaleController < ApplicationController
  def update
    if current_user
      current_user.update locale: params[:locale]
    else
      cookies[:locale] = params[:locale]
    end
    render json: { status: :success }
  end
end
