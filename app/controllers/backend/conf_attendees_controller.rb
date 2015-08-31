class Backend::ConfAttendeesController < Backend::BaseController
  before_action :set_backend_conf_attendee, only: [:show, :edit, :update, :destroy]

  # GET /backend/conf_attendees
  # GET /backend/conf_attendees.json
  def index
    @backend_conf_attendees = Conf::Attendee.all
  end

  # GET /backend/conf_attendees/1
  # GET /backend/conf_attendees/1.json
  def show
  end

  # GET /backend/conf_attendees/new
  def new
    @backend_conf_attendee = Conf::Attendee.new
  end

  # GET /backend/conf_attendees/1/edit
  def edit
  end

  # POST /backend/conf_attendees
  # POST /backend/conf_attendees.json
  def create
    @backend_conf_attendee = Conf::Attendee.new(backend_conf_attendee_params)

    respond_to do |format|
      if @backend_conf_attendee.save
        format.html { redirect_to backend_conf_attendee_path(@backend_conf_attendee), notice: 'Conf attendee was successfully created.' }
        format.json { render :show, status: :created, location: backend_conf_attendee_path(@backend_conf_attendee) }
      else
        format.html { render :new }
        format.json { render json: @backend_conf_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/conf_attendees/1
  # PATCH/PUT /backend/conf_attendees/1.json
  def update
    respond_to do |format|
      if @backend_conf_attendee.update(backend_conf_attendee_params)
        format.html { redirect_to backend_conf_attendee_path(@backend_conf_attendee), notice: 'Conf attendee was successfully updated.' }
        format.json { render :show, status: :ok, location: backend_conf_attendee_path(@backend_conf_attendee) }
      else
        format.html { render :edit }
        format.json { render json: @backend_conf_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/conf_attendees/1
  # DELETE /backend/conf_attendees/1.json
  def destroy
    @backend_conf_attendee.destroy
    respond_to do |format|
      format.html { redirect_to backend_conf_attendees_url, notice: 'Conf attendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_conf_attendee
      @backend_conf_attendee = Conf::Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_conf_attendee_params
      params.require(:conf_attendee).permit(:identity, :check_code, :ticket_type, :name, :email, :org, :title, :github, :twitter)
    end
end
