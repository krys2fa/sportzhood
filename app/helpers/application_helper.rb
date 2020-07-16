module ApplicationHelper
  def nav_menu(categories)
    category_links = ''

    if @current_user
      category_links << content_tag(:li, link_to('WRITE AN ARTICLE', new_article_path, class: 'nav-theme nav-margin'))
    end

    categories.each do |category|
      category_links << content_tag(:li, link_to(category.name.upcase, category_path(category),
                                                 class: 'nav-theme nav-margin'))
    end

    category_links.html_safe
  end

  def display_flash(flash)
    message = ''
    flash.each do |key, value|
      message << content_tag(:div, value, class: "alert alert-#{key}")
    end
    message.html_safe
  end
end
