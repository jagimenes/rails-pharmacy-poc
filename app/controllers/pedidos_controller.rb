class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    if current_user.role == "admin"
      @pedidos = Pedido.all
      @pedidos = @pedidos.sort_by{|e| e[:paciente]}
    else
      @pedidos = Pedido.where(user_id: current_user.id)
      @pedidos = @pedidos.sort_by{|e| e[:paciente]}
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @unidades = Unidade.all
    @unidadesponto = Unidade.all
    @produtosponto = Produto.all
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @unidades = Unidade.all
    @unidadesponto = Unidade.all
    @produtosponto = Produto.all
  end

  # GET /pedidos/1/edit
  def edit
    @unidades = Unidade.all
    @unidadesponto = Unidade.all
    @produtosponto = Produto.all
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
    @unidadesponto = Unidade.all
    @produtosponto = Produto.all    
    @unidades = Unidade.all
    @pedido = Pedido.new(pedido_params)
    puts params.class.name
    puts pedido_params.inspect
    respond_to do |format|
    @pedido.user_id = current_user.id


      #Adiciona os ingredientes dos produtos
    produtos_id  = params[:idproduto]
    unidades_id  = params[:idunidade]
    quantidades  = params[:quantidadeproduto]
    formulaParam = params[:idFormula]

      if produtos_id
        produtos_id.each_with_index do |produto, index|
          ponto = Ponto.new :produto_id => produtos_id[index], :unidade_id => unidades_id[index], :quantidade => quantidades[index]
          puts "Ponto: " + ponto.to_s
          for manipulados in @pedido.manipulados
              puts "For manipulados, FORMULA ID: " + manipulados.formula_id.to_s + " E FORMULA INDEX: " + formulaParam[index]
              if manipulados.formula_id = formulaParam[index]
                  puts "Achou manipulado"
                  manipulados.pontos.push(ponto)
              end
          end
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
    @unidades = Unidade.all
    @especialidades = Especialidade.all
    @dataProdutos = Produto.all
    @unidadesponto = Unidade.all
    @produtosponto = Produto.all    
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
    @items = Item.joins(:pedido).where(' pedidos.id = ?', @pedido.id)
    @items.destroy_all

    @manipulados = Manipulado.joins(:pedido).where(' pedidos.id = ?', @pedido.id)
    @manipulados.destroy_all

    @pontos = Ponto.joins(:manipulado).where(' manipulados.pedido_id = ?', @pedido.id)
    @pontos.destroy_all

    @pedido.destroy
    @unidades = Unidade.all
    @unidadesponto = Unidade.all
    @produtosponto = Produto.all
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
      params.require(:pedido).permit(:user_id, :especialidade_id, :paciente, items_attributes: [:id, :especialidade_id, :quantidade, :_destroy, :produto_id, :unidade_id, :posologia, :veiculo_id, :quantidade_veiculo, :unidade_veiculo_id ], manipulados_attributes: [:imprimir, :id, :formula_id, :quantidade, :_destroy, :produto_id, :posologia, :veiculo_id, :quantidade_veiculo, :unidade_id, :especialidade_id, pontos_attributes: [:id, :_destroy, :produto_id, :quantidade, :unidade_id ] ] )
    end
end