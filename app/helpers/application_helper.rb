module ApplicationHelper

  def get_categories
    Category.order(name: :asc)
  end
end
