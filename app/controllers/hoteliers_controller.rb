class HoteliersController < ApplicationController
  before_action :set_hotelier, only: %i[ show edit update destroy ]

  # GET /hoteliers or /hoteliers.json
  def index
    @hoteliers = Hotelier.all
  end

  # GET /hoteliers/1 or /hoteliers/1.json
  def show
  end

  # GET /hoteliers/new
  def new
    @hotelier = Hotelier.new
  end

  # GET /hoteliers/1/edit
  def edit
  end

  # POST /hoteliers or /hoteliers.json
  def create
    @hotelier = Hotelier.new(hotelier_params)

    respond_to do |format|
      if @hotelier.save
        format.html { redirect_to hotelier_url(@hotelier), notice: "Hotelier was successfully created." }
        format.json { render :show, status: :created, location: @hotelier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotelier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hoteliers/1 or /hoteliers/1.json
  def update
    respond_to do |format|
      if @hotelier.update(hotelier_params)
        format.html { redirect_to hotelier_url(@hotelier), notice: "Hotelier was successfully updated." }
        format.json { render :show, status: :ok, location: @hotelier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotelier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoteliers/1 or /hoteliers/1.json
  def destroy
    @hotelier.destroy

    respond_to do |format|
      format.html { redirect_to hoteliers_url, notice: "Hotelier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotelier
      @hotelier = Hotelier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotelier_params
      params.require(:hotelier).permit(:name, :cpf, :phone_number, :plan)
    end
end
