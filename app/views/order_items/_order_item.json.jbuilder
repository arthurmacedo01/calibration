json.extract! order_item, :id, :order_id, :equipment_id, :service_id, :status, :obs, :accessories, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
