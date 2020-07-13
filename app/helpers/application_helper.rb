module ApplicationHelper

  def nav_menu(categories)
    if @current_user
      link_to('WRITE AN ARTICLE', new_article_path)
    else
      # content_tag :ul do
      #   categories.collect do |category|
      #     concat(content_tag(:li, category.Name.upcase, category_path(category)))
      #   end
      # end

      categories.each do |category|
        concat(content_tag(:li, link_to(category.Name.upcase, category_path(category))))
      end
    end
  end

end

# content_tag :li do
#     concat link_to(seo_url(taxon)) do
#        content_tag(:span, '(50)', class: 'pull-right') + taxon.name
#     end
#     concat taxons_tree(taxon, current_taxon, max_level - 1)
#   end


# <ul class="nav navbar-nav">
#           <%# @nav_categories.each do |category| %>
#           <li><%#= link_to category.Name.upcase, category_path(category) %></li>
#           <%# end %>
#         </ul>

#         content_tag :ul do
#           collection_to_pass.collect do |c|
#                concat(content_tag(:li, c.your_param, class : "your_class_name"))
#      end
#    end
