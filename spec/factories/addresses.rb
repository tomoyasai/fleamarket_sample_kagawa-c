FactoryBot.define do
  factory :address do
    post_code              {"2222222"}
    prefecture_id          {1}
    city                   {"高松テスト市"}
    block_number           {"テスト町"}
    building_name          {"テストアパート"}
    tel                    {"000-0000-0000"}
    user_id                {1}
  end
end