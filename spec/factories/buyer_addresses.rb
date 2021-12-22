FactoryBot.define do
  factory :buyer_address do
    postal_code {"123-4567"}
    delivery_area_id {2}
    manicipality {"町田"}
    house_number {6-1-5}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
