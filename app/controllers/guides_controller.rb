class GuidesController < ApplicationController
  before_action :set_guide, only: %i[ show edit update destroy ]

  # GET /guides or /guides.json
  def index
    @guides = Guide.all
  end

  # GET /guides/1 or /guides/1.json
  def show
  end

  # GET /guides/new
  def new
    @guide = Guide.new
    @guide.build_address
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides or /guides.json
  def create
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to guide_url(@guide), notice: t('app.guides_controller.create.success') }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1 or /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to guide_url(@guide), notice: t('app.guides_controller.update.success') }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1 or /guides/1.json
  def destroy
    @guide.destroy

    respond_to do |format|
      format.html { redirect_to guides_url, notice: t('app.guides_controller.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guide_params
      params.require(:guide).permit(:name, :phone, :cpf, :company, :cnpj,
                                    address_attributes: [:id, :street, :postal_code, :city, :state])
    end
end
