class Backend::AttendeesController < Backend::BaseController
  def import
    res = ::Conf::Attendee.import_from_csv(params[:file].path)
    redirect_to backend_attendees_path, notice: "新建 #{res.size} 筆報名者資料"
  end

  private

  def collection_scope
    Conf::Attendee
  end

  def object_params
    params.require(:attendee).permit(:identity, :check_code, :ticket_type,
                                     :name, :email, :org, :github, :twitter)
  end
end
