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
        if row["solicitante_nome"].nil?
          raise StandardError, 'Falta a coluna solicitante_nome no arquivo CSV'
        end
        if row["solicitante_divisao"].nil?
          raise StandardError, 'Falta a coluna solicitante_divisao no arquivo CSV'
        end
        if row["solicitante_subdivisao"].nil?
          raise StandardError, 'Falta a coluna solicitante_subdivisao no arquivo CSV'
        end
        if row["solicitante_fone"].nil?
          raise StandardError, 'Falta a coluna solicitante_fone no arquivo CSV'
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
          division: row["solicitante_divisao"],
          subdivision: row["solicitante_subdivisao"],
          phone: row["solicitante_fone"],
        ).find_or_create_by(name: row["solicitante_nome"])

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
          date: getDate(row["data_item"])
        )
        orderItem.save!
      end
    rescue StandardError=>e
      raise e  # Reraise the exception for further handling or logging
    rescue
      raise "Problemas com arquivo CSV."    
    end
  end

  private

  def self.getDate(original_date)
    date = Date.strptime(original_date, '%d/%m/%Y')
    if date.year <100
      if date.year <= (Date.today.year + 30) % 100
        date = Date.new(date.year + (Date.today.year/ 100) *100,date.month,date.day)
      else
        date = Date.new(date.year + (Date.today.year/ 100 - 1) *100,date.month,date.day)
      end
    end
    return date
  end
end
