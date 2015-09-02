class Backend::ActivitiesController < Backend::BaseController
  def fetch
    after_id = Conf::Activity.maximum(:id)
    ress = Conf::Activity.fetch_codemecc_json(after_id: after_id)
    redirect_to backend_activities_path, notice: "新建 #{ress.size} 筆資料"
  end
  private

  def collection_scope
    Conf::Activity
  end

  def object_params
    params.require(:activity).permit(:attendee_id, :event_id, :happened_at)
  end
end
