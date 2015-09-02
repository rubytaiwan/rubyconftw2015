class Backend::EventsController < Backend::BaseController

  private

  def collection_scope
    Conf::Event
  end

  def object_params
    params.require(:event).permit(:name, :category, :slug)
  end
end
