json.extract! produto, :id, :descricao, :observacoes, :ativo, :created_at, :updated_at
json.url produto_url(produto, format: :json)