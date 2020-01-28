class ServicosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :ativos]
  before_action :verifica_admin, only: [:index, :show, :edit, :update, :destroy, :ativos]
  before_action :set_servico, only: [:show, :edit, :update, :destroy]

  # GET /servicos
  # GET /servicos.json
  def index
    @servicos = Servico.all
  end

  def ativos
    @servicos = Servico.where(status: 'ativo')
    render :index
  end
  # GET /servicos/1
  # GET /servicos/1.json
  def show
  end

  # GET /servicos/new
  def new
    @servico = Servico.new
  end

  # GET /servicos/1/edit
  def edit
  end
    
  # POST /servicos
  # POST /servicos.json
  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        @servico.verifica_status
        ServicoMailer.notificacao_servico(@servico).deliver_now
        format.html { redirect_to pagina_inicial_servicos_path, notice: 'Seu serviço foi adicionado.' }
      else
        format.html { render :new }
      end
    end
  end

  def pagina_inicial
  end

  def descricao
  end
  # PATCH/PUT /servicos/1
  # PATCH/PUT /servicos/1.json
  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to @servico, notice: 'Serviço alterado com sucesso!' }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1
  # DELETE /servicos/1.json
  def destroy
    @servico.destroy
    respond_to do |format|
      format.html { redirect_to servicos_url, notice: 'Servico destruído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico
      @servico = Servico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servico_params
        params.require(:servico).permit(:nome, :email, :fone, :inicio, :fim)
    end

    def verifica_admin
      if current_user.admin != true
        redirect_to pagina_inicial_servicos_path
      end
    end
end
