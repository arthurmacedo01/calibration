class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[ show edit update destroy ]
  before_action :set_clients, only: %i[ new edit ]

  # GET /equipment or /equipment.json
  def index
    @equipment = Equipment.all
  end

  # GET /equipment/1 or /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment or /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to equipment_url(@equipment), notice: "Equipment was successfully created." }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1 or /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to equipment_url(@equipment), notice: "Equipment was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1 or /equipment/1.json
  def destroy
    begin
      @equipment.destroy
      flash[:notice] = 'Equipment was successfully destroyed.'         
    rescue ActiveRecord::DeleteRestrictionError => e
      flash[:alert] = 'Cannot delete the model because it has associated records.'
    ensure
      redirect_to equipment_index_url  
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_params
      params.require(:equipment).permit(:description, :manufacturer, :model, :serial_number, :client_id)
    end

    def set_clients
      @clients = Client.all
    end
end