FactoryBot.define do
  factory :item do
    name { "aa" }
    info  { "bb" }             
    image { File.open("#{Rails.root}/public/images/test_image.jpg") }
    category_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    delivery_days_id { 1 }
    prefecture_id { 1 }
    price  { "1000" }
    user_id { 1 } 
  end

end