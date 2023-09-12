class ItemsLoaderController < ApplicationController

  def load_csv
    if params[:file].present?
      CsvOrderItemsLoader.call(params[:file],params[:order_id])
       redirect_to order_path(params[:order_id]), notice: "CSV file imported successfully."
    else
      redirect_to order_path(params[:order_id]), alert: "Please select a CSV file."
    end
  end
end
