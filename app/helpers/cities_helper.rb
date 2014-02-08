module CitiesHelper
  def link_to_for_parent(parent)
    if parent.class == City
      link_to "Add a link", new_city_link_path(parent)
    end
  end
end