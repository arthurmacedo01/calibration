json.extract! client, :id, :name, :division, :subdivision, :created_at, :updated_at
json.url client_url(client, format: :json)
