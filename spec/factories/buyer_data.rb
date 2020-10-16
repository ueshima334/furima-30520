FactoryBot.define do
  factory :BuyerData do
    postal_code    { '111-1111' }
    prefecture_id  { 2 }
    city           { '横浜市緑区' }
    address        { '青山1-1-1' }
    phone_number   { 1_111_111_111 }
    token { 'tok_abcdefghijk00000000000000000' }

    association :buyer
  end
end
