module BillsHelper
  def bill_to_for_parent(parent)
    if parent.class == City
      link_to "Post", new_city_bill_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == State
      link_to "Post", new_state_bill_path(parent), :class => "btn btn-xs btn-primary"
    elsif parent.class == Country
      link_to "Post", new_country_bill_path(parent), :class => "btn btn-xs btn-primary"
    end
  end
end
 