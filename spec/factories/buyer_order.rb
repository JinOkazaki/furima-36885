FactoryBot.define do
  factory :buyer_order do
    postal {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Gimei.address.city.kanji}
    address {Gimei.address.town.kanji}
    building_name {Faker::Address.city_suffix}
    tell_number {'09022223333'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
