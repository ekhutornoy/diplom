module CategoriesHelper
  def category_tree(categories)
    categories.collect do |c, sub|
      render(c) +
        content_tag(:div, category_tree(sub), :class => 'nested_categories')
    end.join.html_safe
  end
end
