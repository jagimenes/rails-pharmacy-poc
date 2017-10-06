# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170809004713) do

  create_table "diluentes", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "veiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_diluentes_on_produto_id"
    t.index ["veiculo_id"], name: "index_diluentes_on_veiculo_id"
  end

  create_table "especialidades", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formulas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "observacoes"
    t.integer  "user_id"
    t.integer  "especialidade_id"
    t.integer  "veiculo_id"
    t.integer  "unidade_id"
    t.float    "quantidade"
    t.boolean  "editar"
    t.index ["especialidade_id"], name: "index_formulas_on_especialidade_id"
    t.index ["unidade_id"], name: "index_formulas_on_unidade_id"
    t.index ["user_id"], name: "index_formulas_on_user_id"
    t.index ["veiculo_id"], name: "index_formulas_on_veiculo_id"
  end

  create_table "grupos", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "especialidade_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["especialidade_id"], name: "index_grupos_on_especialidade_id"
    t.index ["produto_id"], name: "index_grupos_on_produto_id"
  end

  create_table "ingredientes", force: :cascade do |t|
    t.integer  "formula_id"
    t.integer  "produto_id"
    t.integer  "unidade_id"
    t.float    "quantidade"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "especialidade_id"
    t.index ["especialidade_id"], name: "index_ingredientes_on_especialidade_id"
    t.index ["formula_id"], name: "index_ingredientes_on_formula_id"
    t.index ["produto_id"], name: "index_ingredientes_on_produto_id"
    t.index ["unidade_id"], name: "index_ingredientes_on_unidade_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.integer  "unidade_id"
    t.float    "quantidade"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "posologia"
    t.integer  "especialidade_id"
    t.integer  "veiculo_id"
    t.float    "quantidade_veiculo"
    t.integer  "unidade_veiculo_id"
    t.index ["especialidade_id"], name: "index_items_on_especialidade_id"
    t.index ["pedido_id"], name: "index_items_on_pedido_id"
    t.index ["produto_id"], name: "index_items_on_produto_id"
    t.index ["unidade_id"], name: "index_items_on_unidade_id"
    t.index ["unidade_veiculo_id"], name: "index_items_on_unidade_veiculo_id"
    t.index ["veiculo_id"], name: "index_items_on_veiculo_id"
  end

  create_table "manipulados", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "formula_id"
    t.float    "quantidade"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "posologia"
    t.integer  "especialidade_id"
    t.integer  "veiculo_id"
    t.integer  "unidade_id"
    t.float    "quantidade_veiculo"
    t.string   "observacoes"
    t.boolean  "imprimir"
    t.index ["especialidade_id"], name: "index_manipulados_on_especialidade_id"
    t.index ["formula_id"], name: "index_manipulados_on_formula_id"
    t.index ["pedido_id"], name: "index_manipulados_on_pedido_id"
    t.index ["unidade_id"], name: "index_manipulados_on_unidade_id"
    t.index ["veiculo_id"], name: "index_manipulados_on_veiculo_id"
  end

  create_table "pais", force: :cascade do |t|
    t.string   "pai"
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string   "paciente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "permissaos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "especialidade_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["especialidade_id"], name: "index_permissaos_on_especialidade_id"
    t.index ["user_id"], name: "index_permissaos_on_user_id"
  end

  create_table "pontos", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "unidade_id"
    t.float    "quantidade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "manipulado_id"
    t.index ["manipulado_id"], name: "index_pontos_on_manipulado_id"
    t.index ["produto_id"], name: "index_pontos_on_produto_id"
    t.index ["unidade_id"], name: "index_pontos_on_unidade_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "descricao"
    t.string   "observacoes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "maximo"
    t.integer  "unidade_id"
    t.string   "sinonimo"
    t.index ["unidade_id"], name: "index_produtos_on_unidade_id"
  end

  create_table "receita", force: :cascade do |t|
    t.string   "paciente"
    t.integer  "user_id"
    t.string   "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_receita_on_user_id"
  end

  create_table "unidades", force: :cascade do |t|
    t.string   "unidade"
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pai_id"
    t.float    "fator"
    t.index ["pai_id"], name: "index_unidades_on_pai_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "crm"
    t.string   "cpf"
    t.string   "endereco"
    t.string   "clinica"
    t.string   "telefone"
    t.boolean  "cabecalho"
    t.boolean  "todos"
    t.integer  "superior"
    t.integer  "lateral"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "observacoes"
  end

end
