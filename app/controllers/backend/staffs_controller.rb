class Backend::StaffsController <  Backend::BaseController

  private
  def collection_scope
      Staff
  end

  def object_params
    params.require(:staff).permit(:name, :link)
  end

end
