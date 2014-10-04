class FoodsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_fridge
  before_action :set_food, only: [:edit, :update, :destroy]

  # GET /foods/new
  def new
    @food = @fridge.foods.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = @fridge.foods.create(food_params)
    respond_with @food, location: -> { kitchen_board_path }
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    @food.update(food_params)
    respond_with @food, location: -> { kitchen_board_path }
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_with @food, location: -> { kitchen_board_path }
  end

  private

    def set_fridge
      @fridge = current_user.fridges.find(params[:fridge_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = @fridge.foods.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :deadline)
    end

    def interpolation_options
      { resource_name: @food.name }
    end
end
