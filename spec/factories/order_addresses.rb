FactoryBot.define do
  factory :order_address do
    post_code { '123-0000' }
    prefecture_id { 2 }
    city { "2" }
    address { '1-1' }
    building_name { '神奈川マンション' }
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end