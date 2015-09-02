class ActivitiesController < ApplicationController
  layout "sub"
  def attended
    attendee = Conf::Attendee.find_by(check_code: params[:code])
    event_id2activity = {}
    attendee.activities.each do |a|
      event_id2activity[a.event_id] = a
    end
    events = Conf::Event.all
    @events = []
    @sessions = []
    events.each do |e|
      if e.is_session?
        if event_id2activity.has_key?(e.id)
          e.activity = event_id2activity[e.id]
        end
        @sessions << e
      else
        if event_id2activity.has_key?(e.id)
          e.activity = event_id2activity[e.id]
        end
        @events << e
      end
    end

  end
end
