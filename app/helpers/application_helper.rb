module ApplicationHelper

  #Method for full tilte generation
  def full_title(page_title = '')
    base_title = "Portal rowerowy"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end