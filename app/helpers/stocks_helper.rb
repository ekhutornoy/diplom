module StocksHelper
  def stocks_category_tree(categories)
    categories.collect do |c, sub|
      link_to(c.name, stocks_path(:category_id => c.id)) +
        content_tag(:div, stocks_category_tree(sub), :class => 'nested_categories')
    end.join.html_safe
  end
end
