class CsvOrderItemsLoader
  require "csv"

  def self.call(file,order_id)
    begin      
      csv_text = File.read(file)
      csv = CSV.parse(csv_text, headers: true, encoding: "utf-8")
      csv.each do |row|
        if row["equipamento_descricao"].nil?
          raise StandardError, 'Falta a coluna equipamento_descricao no arquivo CSV'
        end
        if row["fabricante"].nil?
          raise StandardError, 'Falta a coluna fabricante no arquivo CSV'
        end
        if row["modelo"].nil?
          raise StandardError, 'Falta a coluna modelo no arquivo CSV'
        end
        if row["numero_serial"].nil?
          raise StandardError, 'Falta a coluna numero_serial no arquivo CSV'
        end
        if row["cliente_nome"].nil?
          raise StandardError, 'Falta a coluna cliente_nome no arquivo CSV'
        end
        if row["cliente_divisao"].nil?
          raise StandardError, 'Falta a coluna cliente_divisao no arquivo CSV'
        end
        if row["cliente_subdivisao"].nil?
          raise StandardError, 'Falta a coluna cliente_subdivisao no arquivo CSV'
        end
        if row["servico_codigo"].nil?
          raise StandardError, 'Falta a coluna servico_codigo no arquivo CSV'
        end
        if row["item_observacao"].nil?
          raise StandardError, 'Falta a coluna item_observacao no arquivo CSV'
        end
        if row["item_acessorios"].nil?
          raise StandardError, 'Falta a coluna item_acessorios no arquivo CSV'
        end
        if row["data_item"].nil?
          raise StandardError, 'Falta a coluna data_item no arquivo CSV'
        end

        service = Service.find_by(code: row["servico_codigo"])
        if service.nil?        
          raise StandardError, 'Há uma referência de um serviço não cadastrado no arquivo CSV'    
        end

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
          accessories: row["item_acessorios"],
          date: Date.strptime(row["data_item"], '%d/%m/%Y')
        )
      orderItem.save!
    rescue StandardError=>e
      raise e  # Reraise the exception for further handling or logging
    rescue
      raise "Problemas com arquivo CSV."    
    end

    end
  end

end
