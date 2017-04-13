class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.where(user_id: current_user.id)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @unidades = Unidade.all
  end

  # GET /pedidos/1/edit
  def edit
    @unidades = Unidade.all
  end


# Criamos este método que vai chamar nossa lib para gerar o PDF e depois redirecionar o user para o arquivo PDF
  def export
    @pedido = Pedido.find(params[:pedido_id])
    GeneratePdf::pedido(@pedido.id, current_user)
    redirect_to '/receita.pdf'
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    puts params.class.name
    puts pedido_params.inspect
    respond_to do |format|
    @pedido.user_id = current_user.id
      for items in @pedido.items
        if items.quantidade > items.produto.maximo
            puts "QUANTIDADE MAIOR"
        end
      end

      if @pedido.save
        format.html { redirect_to pedidos_url, notice: 'Receita adicionada com sucesso.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    @especialidades = Especialidade.all
    @dataProdutos = Produto.all
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedidos_url, notice: 'Receita atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Receita excluida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:user_id, :especialidade_id, :paciente, items_attributes: [:id, :especialidade_id, :quantidade, :_destroy, :produto_id, :unidade_id, :posologia, :veiculo_id, :quantidade_veiculo, :unidade_veiculo_id ], manipulados_attributes: [:id, :formula_id, :quantidade, :_destroy, :produto_id, :posologia, :veiculo_id, :quantidade_veiculo, :unidade_id, :especialidade_id ] )
    end
end