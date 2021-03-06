class Dish < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :branch

  validates :name, presence: true
  validates_presence_of :price, :category, :branch
  validate :special_dish, on: :create

  def special_dish
    if self.special == true
      validates_presence_of :image
      validates_presence_of :description
    end
  end

  def category_name
    self.category.name if self.category
  end

  def branch_name
    self.branch.name if self.branch
  end

  # Special dishes
  def self.special_dishes
    return where(special: true)
  end
end
