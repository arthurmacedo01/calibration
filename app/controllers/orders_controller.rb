class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_equipments, only: %i[ show ]
  before_action :set_status_options, only: %i[ show ]
  before_action :set_services, only: %i[ show ]
  before_action :authenticate_user!
  
  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Pedido criado com sucesso." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Pedido atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    begin
      @order.destroy
      flash[:notice] = 'Pedido excluído com sucesso.'
      redirect_to orders_url  
    rescue ActiveRecord::DeleteRestrictionError => e
      flash[:alert] = 'Não é possível excluir pois há registros associados.'    
      redirect_to @order
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      @order_items = OrderItem.where(order:params[:id]).includes( service: [:section]).reverse()
      @new_order_item = OrderItem.new(order_id: @order.id)
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:doc_type, :doc_number, :sigad, :nup, :date)
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
