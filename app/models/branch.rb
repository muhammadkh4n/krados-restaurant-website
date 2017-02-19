class Branch < ActiveRecord::Base
  has_many :dishes, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Put all branches in a hash and group their dishes by category
  def self.group_dishes_by_category
    branches = order(:id)
    res = {}
    if branches
      branches.each do |branch|
        res[branch.name] = {}
        branch.dishes.each do |dish|
          if res[branch.name][dish.category_name].nil?
            res[branch.name][dish.category_name] = [dish]
          else
            res[branch.name][dish.category_name] << dish
          end
        end
      end
    end
    res
  end

  # Get branch menu
  def group_dishes_by_category
    res = {}
    self.dishes.each do |dish|
      if res[dish.category_name].nil?
        res[dish.category_name] = [dish]
      else
        res[dish.category_name] << dish
      end
    end
    res
  end
end
