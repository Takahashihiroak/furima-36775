FactoryBot.define do
  factory :item do
    name {'孫悟空'}
    price {'1000'}
    text {'最高'}
    category_id {3}
    condition_id {3}
    delivery_day_id {3}
    delivery_fee_id {3}
    prefecture_id {3}
    association :user 
    

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
