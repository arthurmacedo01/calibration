class AddCodeToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :code, :string, null: false
  end
end
