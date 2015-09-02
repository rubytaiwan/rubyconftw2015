class ActivitySearchForm < BasicSearchForm

  search_field :attendee_name_like, lambda{|attendee| where("conf_attendees.name LIKE?", "%#{attendee}")}
  search_field :event_name_like, lambda{|event| where("conf_events.name LIKE ?", "%#{event}%")}

  def basic_scope
    Conf::Activity.joins(:event, :attendee).preload(:event, :attendee)
  end

end
