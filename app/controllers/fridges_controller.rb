class FridgesController < ApplicationController
  before_action :set_fridge, only: [:show, :edit, :update, :destroy]

  # GET /fridges
  # GET /fridges.json
  def index
    @fridges = Fridge.all
  end

  # GET /fridges/1
  # GET /fridges/1.json
  def show
  end

  # GET /fridges/new
  def new
    @fridge = Fridge.new
  end

  # GET /fridges/1/edit
  def edit
  end

  # POST /fridges
  # POST /fridges.json
  def create
    @fridge = Fridge.new(fridge_params)

    respond_to do |format|
      if @fridge.save
        format.html { redirect_to @fridge, notice: 'Fridge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fridge }
      else
        format.html { render action: 'new' }
        format.json { render json: @fridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fridges/1
  # PATCH/PUT /fridges/1.json
  def update
    respond_to do |format|
      if @fridge.update(fridge_params)
        format.html { redirect_to @fridge, notice: 'Fridge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fridges/1
  # DELETE /fridges/1.json
  def destroy
    @fridge.destroy
    respond_to do |format|
      format.html { redirect_to fridges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fridge
      @fridge = Fridge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fridge_params
      params.require(:fridge).permit(:name, :user_id)
    end
end
