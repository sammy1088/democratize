module EventsHelper
  def event_to_for_parent(parent)
    if parent.class == City
      link_to "Post", new_city_event_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == State
      link_to "Post", new_state_event_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == District
      link_to "Post", new_city_district_event_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == Rep
      link_to "Post", new_rep_event_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == Country
      link_to "Post", new_country_event_path(parent), :class => "btn btn-xs btn-primary"
    end
  end
end
 