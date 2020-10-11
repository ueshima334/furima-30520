FactoryBot.define do
  factory :product do
    title               { 'aiueo' }
    details             { 'aiueo' }
    category_id         { 2 }
    status_id           { 2 }
    delivery_charge_id  { 2 }
    area_id             { 2 }
    days_id             { 2 }
    price               { 300 }

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
