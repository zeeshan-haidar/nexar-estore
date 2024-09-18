module ApplicationHelper
  def product_categories
    Category.order(name: :asc)
  end

  def user_email
    current_user.email
  end
end
