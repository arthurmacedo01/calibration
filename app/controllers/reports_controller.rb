class ReportsController < ApplicationController
  before_action :set_options, only: %i[ index ]


  def index
    @order_items = OrderItem.includes({service: :section}, :order, :equipment).all
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

  private

  def set_options
    @status_options = OrderItem::STATUS_OPTIONS
    @generated_document_options = OrderItem::DOCUMENT_TYPE_OPTIONS
    @accessories_options = OrderItem::ACCESSORIES_OPTIONS
  end

end
