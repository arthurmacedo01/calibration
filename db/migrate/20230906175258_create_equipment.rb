class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.text :description
      t.string :manufacturer
      t.string :model
      t.string :serial_number
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
