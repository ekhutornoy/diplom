module ProductsHelper
  def products_category_tree(categories)
    categories.collect do |c, sub|
      link_to(c.name, products_path(:category_id => c.id)) +
        content_tag(:div, products_category_tree(sub), :class => 'nested_categories')
    end.join.html_safe
  end
end
