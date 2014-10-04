class FridgesController < ApplicationController
  before_action :authenticate_user!, except: [:inbound]
  skip_before_action :verify_authenticity_token, only: [:inbound]

  before_action :set_fridge, only: [:show, :edit, :update, :destroy]


  # GET /fridges/new
  def new
    @fridge = current_user.fridges.new
  end

  # GET /fridges/1/edit
  def edit
  end

  # POST /fridges
  # POST /fridges.json
  def create
    @fridge = current_user.fridges.create(fridge_params)
    respond_with @fridge, location: -> { kitchen_board_path }
  end

  # PATCH/PUT /fridges/1
  # PATCH/PUT /fridges/1.json
  def update
    @fridge.update(fridge_params)
    respond_with @fridge, location: -> { kitchen_board_path }
  end

  # DELETE /fridges/1
  # DELETE /fridges/1.json
  def destroy
    @fridge.destroy
    respond_with @fridge, location: -> { kitchen_board_path }
  end

  def inbound
    set_inbound_data
    raise unless @fridge = Fridge.where(inbound_token: @inbound_token).first
    Fridge.parse_inbound_msg(@inbound_msg).each do |name, deadline|
      @fridge.foods.create name: name, deadline: deadline
    end
    render text: 'success'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_fridge
    @fridge = current_user.fridges.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fridge_params
    params.require(:fridge).permit(:name)
  end

  def set_inbound_data
    raise unless params[:mandrill_events]
    data = ActiveSupport::JSON.decode(params[:mandrill_events])
    data = data.first if data.is_a? Array
    raise unless data['event'] && data['event'] == 'inbound'
    raise unless data['msg'] && @inbound_msg = data['msg']
    raise unless (m = @inbound_msg['to'][0][0].match(/^fridge-(.*)@freeza.me$/))[0] && @inbound_token = m[1]
  end

  def interpolation_options
    { resource_name: @fridge.name }
  end
end
