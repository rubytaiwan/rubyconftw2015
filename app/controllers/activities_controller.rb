class ActivitiesController < ApplicationController
  layout "sub"
  def attended
    attendee = Conf::Attendee.find_by!(check_code: params[:code])
    event_id2activity = {}
    attendee.activities.each do |a|
      event_id2activity[a.event_id] = a
    end
    events = Conf::Event.all_categorized
    badges = events[:badge].each do |e|
      if e.multi_track?
        e.stripe_multi_track
      end
    end
    @badges = []
    badges.group_by{|b| b.slug }.each do |k,badge|
      badge_attended = nil
      badge.each do |b|
        if event_id2activity.has_key?(b.id)
          b.activity = event_id2activity[b.id]
          badge_attended = b
        end
      end
      if badge_attended
        badge = badge_attended
      else
        badge = badge[0]
      end
      @badges << badge
    end
    @badges.sort! { |a,b| a.attendee_priority_as_badge <=> b.attendee_priority_as_badge  }
    @sessions = []
    events[:session].group_by{|s| s.resource_id}.each do |k,session|
      session_attended = nil
      session.each do |s|
        if event_id2activity.has_key?(s.id)
          s.activity = event_id2activity[s.id]
          session_attended = s
        end
      end
      if session_attended
        session = session_attended
      else
        session = session[0]
      end
      session.stripe_multi_point_number
      @sessions << session
    end
    @sessions.sort! { |a,b| a.attendee_priority_as_session <=> b.attendee_priority_as_session  }
  end
end
