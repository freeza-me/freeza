class HomeController < ApplicationController
  layout false

  def show
    redirect_to kitchen_board_path if current_user
  end
end
