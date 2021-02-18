crumb :root do
  link "フリマ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :card_new do
  link "カード登録", card_new_path
  parent :mypage
end

crumb :item do
  link "商品詳細", item_path
  parent :root
end