class Supermarket < ApplicationRecord
  has_many :items
  validates_presence_of :name
  validates_presence_of :location
end