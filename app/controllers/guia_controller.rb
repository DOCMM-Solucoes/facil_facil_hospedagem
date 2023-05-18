class GuiaController < ApplicationController
  before_action :set_guium, only: %i[ show edit update destroy ]

  # GET /guia or /guia.json
  def index
    @guia = Guium.all
  end

  # GET /guia/1 or /guia/1.json
  def show
  end

  # GET /guia/new
  def new
    @guium = Guium.new
  end

  # GET /guia/1/edit
  def edit
  end

  # POST /guia or /guia.json
  def create
    @guium = Guium.new(guium_params)

    respond_to do |format|
      if @guium.save
        format.html { redirect_to guium_url(@guium), notice: "Guium was successfully created." }
        format.json { render :show, status: :created, location: @guium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guia/1 or /guia/1.json
  def update
    respond_to do |format|
      if @guium.update(guium_params)
        format.html { redirect_to guium_url(@guium), notice: "Guium was successfully updated." }
        format.json { render :show, status: :ok, location: @guium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guia/1 or /guia/1.json
  def destroy
    @guium.destroy

    respond_to do |format|
      format.html { redirect_to guia_url, notice: "Guium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guium
      @guium = Guium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guium_params
      params.require(:guium).permit(:Nome_do_guia, :Telefone, :CPF, :CNPJ, :Cidade, :US)
    end
end
