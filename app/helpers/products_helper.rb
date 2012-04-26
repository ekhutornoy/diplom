module ProductsHelper
  def products_category_tree(categories)
    categories.collect do |c, sub|
      link_to(c.name, products_path(:category_id => c.id)) +
        content_tag(:div, products_category_tree(sub), :class => 'nested_categories')
    end.join.html_safe
  end

  def category_options_tree(categories, selected)
    categories.collect do |c, sub|
      options = { :value => c.id }
      options['selected'] = 'selected' if c.id == selected
      content_tag(:option,
        ("&nbsp;" * 3 * c.depth).html_safe + c.name, options) +
        category_options_tree(sub, selected)
    end.join.html_safe
  end
end
