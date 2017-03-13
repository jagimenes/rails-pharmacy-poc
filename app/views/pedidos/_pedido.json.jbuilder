json.extract! pedido, :id, :paciente, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)