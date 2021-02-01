FactoryBot.define do

  factory :user do
    nick_name             {"ニックネーム"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birthday              {"2020-01-01"}
    family                {"佐藤"}
    first                 {"太郎"}
    family_kana           {"サトウ"}
    first_kana            {"タロウ"}
  end

  factory :address do
    post_code              {"abe"}
    prefecture_id          {1}
    city                   {"高松テスト市"}
    block_number           {"テスト町"}
    building_name          {"テストアパート"}
    tel                    {"000-0000-0000"}
    user_id                    {"11"}
  end

end