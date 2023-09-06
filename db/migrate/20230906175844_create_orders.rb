class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :doc_type
      t.string :doc_number
      t.integer :sigad
      t.string :nup
      t.date :date

      t.timestamps
    end
  end
end
