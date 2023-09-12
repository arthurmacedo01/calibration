class CsvOrderItemsLoader
  require "csv"

  def self.call(file,order_id)

    csv_text = File.read(file)
    csv = CSV.parse(csv_text, headers: true, encoding: "utf-8")
    csv.each do |row|
      service = Service.find_by(description: row["servico_descricao"])

      client = Client.create_with(
        division: row["cliente_divisao"],
        subdivision: row["cliente_subdivisao"],
      ).find_or_create_by(name: row["cliente_nome"])

      puts client.name

      equipment = Equipment.create_with(
        description: row["equipamento_descricao"],
        manufacturer: row["fabricante"],
        model: row["modelo"],
        client_id: client.id,
      ).find_or_create_by(serial_number: row["numero_serial"])

      orderItem = OrderItem.new(
        order_id: order_id,
        equipment_id: equipment.id,
        service_id: service.id,
        status: "Análise Crítica",
        obs: row["item_observacao"],
        accessories: row["item_acessorios"]
      )

      orderItem.save!


    end
  end

end
