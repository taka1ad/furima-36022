class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :delivery_charge
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_day
  has_one_attached :image
  validates :image, :name, :explanation, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
end
