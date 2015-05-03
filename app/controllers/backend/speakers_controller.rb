class Backend::SpeakersController < Backend::BaseController
#  before_action :find_speaker, only:[:show, :destroy, :edit, :update]

#  def index
#  	@speakers = Speaker.all
#  end
#
#  def new
#  	@speaker = Speaker.new
#  end
#
#  def create
#  	@speaker = Speaker.new(speaker_params)
#  	if @speaker.save
#  		flash[:success] = "新增成功"
#  		redirect_to backend_speakers_path
#  	else
#      render 'new'
#    end
#
#  end
#
#  def show
#
#  end
#
#  def destroy
#
#  	@speaker.destroy
#  	redirect_to backend_speakers_path
#  end
#
#  def edit
#
#  end
#  def update
#
#  	if @speaker.update(speaker_params)
#      redirect_to backend_speakers_path
#    else
#      render :edit
#    end
#  end

  private

    def collection_scope
      Speaker
    end

#  	def find_speaker
#  		@speaker = Speaker.find(params[:id])
#  	end

  	def object_params
      params.require(:speaker).permit(:name, :avatat, :biography , :subject , :asbtract)
  	end

end

