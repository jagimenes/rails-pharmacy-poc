json.extract! produto, :id, :descricao, :observacoes, :created_at, :updated_at
json.url produto_url(produto, format: :json)