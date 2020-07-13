module ApplicationHelper
  def nav_menu(categories)
    if @current_user
      content_tag(:li, link_to('WRITE AN ARTICLE', new_article_path))
    else
      category_links = ''
      categories.each do |category|
        category_links << content_tag(:li, link_to(category.Name.upcase, category_path(category)))
      end
      category_links.html_safe
    end
  end
end


# html_values = ""
#   resources.each do |resource|
#     text = resource.name
#     clz = 'label label-primary'
#     html_values << (content_tag :span, text,clz)
#   end
#  html_values.html_safe
