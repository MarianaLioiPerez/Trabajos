class AplicationsController < ApplicationController
  before_action :set_application, only: %i[show edit update destroy]
  before_action :authenticate_tuser!
  before_action :authorize_admin, only: [:index, :destroy]

  

  # GET /aplications or /aplications.json
  def index
    @aplications = Aplication.all
  end

  # GET /aplications/1 or /aplications/1.json
  def show
    @aplications = Aplication.all
  end

  # GET /aplications/new
  def new
    @aplication = Aplication.new
    @aplication.tuser_id = current_tuser.id
  end

  # GET /aplications/1/edit
  def edit
  end

  # POST /aplications or /aplications.json
  def create
    @aplication = Aplication.new(aplication_params)
    @aplication.tuser_id = current_tuser.id

    respond_to do |format|
      if @aplication.save
        send_application_notification(@aplication)

        flash[:notice] = "¡Postulación exitosa! Tu aplicación ha sido registrada."

        format.html { redirect_to aplication_url(@aplication)}
        format.json { render :show, status: :created, location: @aplication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aplications/1 or /aplications/1.json
  def update
    respond_to do |format|
      if @aplication.update(aplication_params)
        format.html { redirect_to aplication_url(@aplication), notice: "Aplication was successfully updated." }
        format.json { render :show, status: :ok, location: @aplication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aplications/1 or /aplications/1.json
  def destroy
    @aplication.destroy

    respond_to do |format|
      format.html { redirect_to aplications_url, notice: "Aplication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aplication
      @aplication = Aplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aplication_params
      params.require(:aplication).permit(:text, :job_offer_id, :tuser_id)
    end

    def send_application_notification(aplication)

      if aplication.save 
        flash[:notice] = "Nueva Postulación."
      end
      # Puedes usar correo electrónico, notificaciones en la aplicación, etc.
    end
end
