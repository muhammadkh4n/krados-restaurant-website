class Category < ActiveRecord::Base
  has_many :dishes, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
