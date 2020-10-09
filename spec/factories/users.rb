FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"0a0a0a"}
    password_confirmation {password}
    last_name{"山田"}
    first_name{"太郎"}
    last_name_kana{"ヤマダ"}
    first_name_kana{"タロウ"}
    birthday{"1999-01-01"}
  end
end