FactoryBot.define do

  factory :user do
    nick_name              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birthday              {}
    family                {}
    first                 {}
    family_kana           {}
    first_kana            {}
    
  end

  factory :address do
    post_code              {"abe"}
    prefecture_id                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end


end