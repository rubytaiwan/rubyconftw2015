class Backend::SponsorsController < Backend::BaseController
  private

    def collection_scope
      Sponsor.order('level, name')
    end

  	def object_params
      params.require(:sponsor).permit(:name, :description, :image, :link, :level)
  	end
end
