FactoryBot.define do
  factory :user do
    nickname {'TARO'}
    last_name {'山田'}
    first_name {'太朗'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {'2000-12-12'}
    email {Faker::Internet.free_email}
    password {'taro000'}
    password_confirmation {password}
  end
end