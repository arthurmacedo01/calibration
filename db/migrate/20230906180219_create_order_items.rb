class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :status
      t.text :obs
      t.text :accessories

      t.timestamps
    end
  end
end
