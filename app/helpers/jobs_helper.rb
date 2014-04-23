module JobsHelper
  def job_to_for_parent(parent)
    if parent.class == City
      link_to "Post", new_city_job_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == State
      link_to "Post", new_state_job_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == District
      link_to "Post", new_city_job_event_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == Rep
      link_to "Post", new_rep_job_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == Country
      link_to "Post", new_country_job_path(parent), :class => "btn btn-xs btn-primary"
    end
  end
end