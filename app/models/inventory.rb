class Inventory < ApplicationRecord
  belongs_to :user

  has_many :inventory_foods

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
