class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]
  before_action :set_order, only: %i[ new ]
  before_action :set_equipments, only: %i[ new create edit update ]
  before_action :set_status_options, only: %i[ index new create edit update ]
  before_action :set_services, only: %i[ new create edit update ]


  # GET /order_items or /order_items.json
  def index
    @order_items = OrderItem.all
    @orders = Order.all
    @sections = Section.all

    # Check for filter parameters
    if params[:order_id].present?
      @order_items = @order_items.where(order_id: params[:order_id])
    end

    # Check for filter parameters
    if params[:section_id].present?
      @order_items = @order_items.joins(service: :section).where(sections: { id: params[:section_id] })
    end

    # Check for filter parameters
    if params[:status].present?
      @order_items = @order_items.where(status: params[:status])
    end

  end

  # GET /order_items/1 or /order_items/1.json
  def show
  end

  # GET /order_items/1/new
  def new
    @order_item = OrderItem.new
    @order_item.order_id = @order.id
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items or /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to order_url(@order_item.order) }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to order_url(@order_item.order), notice: "Item de Pedido atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_url(@order_item.order), notice: "Item de Pedido excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :equipment_id, :service_id, :status, :obs, :accessories, :date)
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    def set_equipments
      @equipments = Equipment.all
    end

    def set_services
      @services = Service.all
    end

    def set_status_options
      @status_options = OrderItem::STATUS_OPTIONS
    end
end
