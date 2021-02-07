FactoryBot.define do
  factory :user do
    nick_name             {"ニックネーム"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birthday              {"20200101"}
    family                {"佐藤"}
    first                 {"太郎"}
    family_kana           {"サトウ"}
    first_kana            {"タロウ"}
    address
  end
end
