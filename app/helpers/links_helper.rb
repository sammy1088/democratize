module LinksHelper
  def link_to_for_parent(parent)
    if parent.class == City
      link_to "Add a link", new_city_link_path(parent)
    elsif parent.class == State
      link_to "Add a link", new_state_link_path(parent)
    elsif parent.class == District
      link_to "Add a link", new_city_district_link_path(parent)
    elsif parent.class == Rep
      link_to "Add a link", new_rep_link_path(parent)  
    elsif parent.class == Country
      link_to "add a link", new_country_link_path(parent)
    end
  end
end
