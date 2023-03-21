FactoryBot.define do
  factory :delivery do
    zip_code            {'123-4567'}
    shipping_region_id  {'1'}
    city                {'中央区中央'}
    city_address        {'1-1-1'}
    building            {'サンクレイドル'}
    telephone           {'09000000000'}
    token               {'tok000o0o0000o0'}
  end
end
