module ApplicationHelper

  def nav_link_active?(link_name)
    return "active" if controller_name == link_name
  end
end
