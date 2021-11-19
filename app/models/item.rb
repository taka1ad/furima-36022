class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  validates :image, :name, :explanation, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true }
  
end
