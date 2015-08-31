class Backend::ConfActivitiesController < Backend::BaseController
  before_action :set_backend_conf_activity, only: [:show, :edit, :update, :destroy]

  # GET /backend/conf_activities
  # GET /backend/conf_activities.json
  def index
    @backend_conf_activities = Conf::Activity.all
  end

  # GET /backend/conf_activities/1
  # GET /backend/conf_activities/1.json
  def show
  end

  # GET /backend/conf_activities/new
  def new
    @backend_conf_activity = Conf::Activity.new
  end

  # GET /backend/conf_activities/1/edit
  def edit
  end

  # POST /backend/conf_activities
  # POST /backend/conf_activities.json
  def create
    @backend_conf_activity = Conf::Activity.new(backend_conf_activity_params)

    respond_to do |format|
      if @backend_conf_activity.save
        format.html { redirect_to backend_conf_activity_path(@backend_conf_activity), notice: 'Conf activity was successfully created.' }
        format.json { render :show, status: :created, location: backend_conf_activity_path(@backend_conf_activity) }
      else
        format.html { render :new }
        format.json { render json: @backend_conf_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/conf_activities/1
  # PATCH/PUT /backend/conf_activities/1.json
  def update
    respond_to do |format|
      if @backend_conf_activity.update(backend_conf_activity_params)
        format.html { redirect_to backend_conf_activity_path(@backend_conf_activity), notice: 'Conf activity was successfully updated.' }
        format.json { render :show, status: :ok, location: backend_conf_activity_path(@backend_conf_activity) }
      else
        format.html { render :edit }
        format.json { render json: @backend_conf_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/conf_activities/1
  # DELETE /backend/conf_activities/1.json
  def destroy
    @backend_conf_activity.destroy
    respond_to do |format|
      format.html { redirect_to backend_conf_activities_url, notice: 'Conf activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_conf_activity
      @backend_conf_activity = Conf::Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_conf_activity_params
      params.require(:conf_activity).permit(:attendee_id, :event_id, :happened_at)
    end
end
