module ApplicationHelper
  def product_categories
    Category.order(name: :asc)
  end
end
