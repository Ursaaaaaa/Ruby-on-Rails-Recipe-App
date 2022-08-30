class InventoryFood < ApplicationRecord
  belongs to :inventory
  belongs to :food

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
