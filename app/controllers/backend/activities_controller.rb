class Backend::ActivitiesController < Backend::BaseController
  helper_method :search_object
  def fetch
    after_id = Conf::Activity.maximum(:id)
    ress = Conf::Activity.fetch_codemecc_json(after_id: after_id)
    redirect_to backend_activities_path, notice: "新建 #{ress.size} 筆資料"
  end

  def index
  end

  private

  def collection_scope
    # Conf::Activity
    @collection_scope ||= search_object.search
  end

  def object_params
    params.require(:activity).permit(:attendee_id, :event_id, :happened_at)
  end

  def search_object
    @search_object ||= ActivitySearchForm.new(search_params)
  end

  def search_params
    if params.has_key?(:activity_search_form)
      params.require(:activity_search_form).permit(:attendee_name_like,:event_name_like)
    end
  end
end
