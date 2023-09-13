class ItemsLoaderController < ApplicationController

  def load_csv
    if params[:file].present?
      begin
        CsvOrderItemsLoader.call(params[:file],params[:order_id])
        redirect_to order_path(params[:order_id]), notice: "CSV file imported successfully."
      rescue StandardError => e
        redirect_to order_path(params[:order_id]), alert: e   
      end
    else
      redirect_to order_path(params[:order_id]), alert: "Please select a CSV file."
    end
  end
end
