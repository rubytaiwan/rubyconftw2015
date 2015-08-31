class Backend::ConfEventsController < Backend::BaseController
  before_action :set_backend_conf_event, only: [:show, :edit, :update, :destroy]

  # GET /backend/conf_events
  # GET /backend/conf_events.json
  def index
    @backend_conf_events = Conf::Event.all
  end

  # GET /backend/conf_events/1
  # GET /backend/conf_events/1.json
  def show
  end

  # GET /backend/conf_events/new
  def new
    @backend_conf_event = Conf::Event.new
  end

  # GET /backend/conf_events/1/edit
  def edit
  end

  # POST /backend/conf_events
  # POST /backend/conf_events.json
  def create
    @backend_conf_event = Conf::Event.new(backend_conf_event_params)

    respond_to do |format|
      if @backend_conf_event.save
        format.html { redirect_to backend_conf_event_path(@backend_conf_event), notice: 'Conf event was successfully created.' }
        format.json { render :show, status: :created, location: backend_conf_event_path(@backend_conf_event) }
      else
        format.html { render :new }
        format.json { render json: @backend_conf_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/conf_events/1
  # PATCH/PUT /backend/conf_events/1.json
  def update
    respond_to do |format|
      if @backend_conf_event.update(backend_conf_event_params)
        format.html { redirect_to backend_conf_event_path(@backend_conf_event), notice: 'Conf event was successfully updated.' }
        format.json { render :show, status: :ok, location: backend_conf_event_path(@backend_conf_event) }
      else
        format.html { render :edit }
        format.json { render json: @backend_conf_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/conf_events/1
  # DELETE /backend/conf_events/1.json
  def destroy
    @backend_conf_event.destroy
    respond_to do |format|
      format.html { redirect_to backend_conf_events_url, notice: 'Conf event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_conf_event
      @backend_conf_event = Conf::Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_conf_event_params
      params.require(:conf_event).permit(:name,:category,:slug)
    end
end
