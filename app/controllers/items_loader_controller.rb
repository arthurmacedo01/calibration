class ItemsLoaderController < ApplicationController

  def load_csv
    if params[:file].present?
      begin
        CsvOrderItemsLoader.call(params[:file],params[:order_id])
        redirect_to order_path(params[:order_id]), notice: "Arquivo CSV importado com sucesso."
      rescue StandardError => e
        redirect_to order_path(params[:order_id]), alert: e   
      end
    else
      redirect_to order_path(params[:order_id]), alert: "Favor selecionar arquivo CSV."
    end
  end
end
