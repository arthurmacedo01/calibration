class AddDateToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :date, :date, null: false
  end
end
