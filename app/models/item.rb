class Item < ApplicationRecord
  belongs_to :supermarket
  validates_presence_of :name
  validates_presence_of :price
  has_many :customer_items
  has_many :customers, through: :customer_items
end