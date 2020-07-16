module ApplicationHelper
  def nav_menu(categories)
    if @current_user
      content_tag(:li, link_to('WRITE AN ARTICLE', new_article_path, class: 'nav-theme'))
    else
      category_links = ''
      categories.each do |category|
        category_links << content_tag(:li, link_to(category.Name.upcase, category_path(category), class: 'nav-theme'))
      end
      category_links.html_safe
    end
  end

  def display_flash(flash)
    message = ''
    flash.each do |key, value|
      message << content_tag(:div, value, class: "alert alert-#{key}")
    end
    message.html_safe
  end
end
