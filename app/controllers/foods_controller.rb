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
    @food = @fridge.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to kitchen_board_path, notice: 'Food was successfully created.' }
        format.json { render action: 'show', status: :created, location: kitchen_board_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to kitchen_board_path, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to kitchen_board_path }
      format.json { head :no_content }
    end
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
end
