class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :manicipality, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :manicipality
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "input correctly"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/}

  end
  validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, manicipality: manicipality, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end




