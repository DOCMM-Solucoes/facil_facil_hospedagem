class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
    @images = @room.images
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: t('app.rooms_controller.create.success') }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @room = Room.find(params[:id])

    if room_params[:images]
      @room.images.attach(room_params[:images])
    end

    respond_to do |format|
      if @room.update(room_params.except(:images))
        format.html { redirect_to room_url(@room), notice: t('app.rooms_controller.update.success') }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: t('app.rooms_controller.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :description, :reference, :maximum_capacity, :status, :photo_1, :photo_2, :photo_3, :photo_4, 
                                   :is_double, :is_triple, :is_quadruple, :is_quintuple, :is_sextuple, :is_single, :is_couple, 
                                   :is_couple_plus_one, :is_couple_plus_two, :is_couple_plus_three, :is_couple_plus_four, 
                                   :is_two_couples, :is_two_couples_plus_one, :is_two_couples_plus_two, :is_three_couples, images: [])
    end
end
