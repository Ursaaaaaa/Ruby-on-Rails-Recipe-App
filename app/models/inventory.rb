class Inventory < ApplicationRecord
  belongs_to :user

  has_many :foods, through: :inventory_food

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
