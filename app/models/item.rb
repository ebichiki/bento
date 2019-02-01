class Item < ApplicationRecord
  has_many :users, through: :order
  has_many :order
  accepts_nested_attributes_for :order
end
