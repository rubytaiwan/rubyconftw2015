class Backend::SpeakersController < Backend::BaseController
  USE_PAGER = false

  def resort
    ids = params[:ids].map(&:to_i)
    Speaker.resort(ids)
    render nothing: true
  end

  private

    def collection_scope
      Speaker.order(:sort_order)
    end

  	def object_params
      params.require(:speaker).permit(:name, :avatar, :biography , :subject , :abstract, :dom_id, :twitter, :github, :home_page, :title, :english, :lt_speaker, :slide_url, :video_url)
  	end

end

