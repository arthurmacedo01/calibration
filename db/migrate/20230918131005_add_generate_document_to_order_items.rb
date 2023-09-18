class AddGenerateDocumentToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :generated_document, :string
    add_column :order_items, :generated_document_date, :date
  end
end
