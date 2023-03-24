FactoryBot.define do
  factory :item_order do
    zip_code            { '123-4567' }
    shipping_region_id  { '10' }
    city                { '中央区' }
    city_address        { '中央1-1-1' }
    building            { 'サンクレイドル' }
    telephone           { '09000000000' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
