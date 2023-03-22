class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :shipping_region_id, :city, :city_address, :building, :telephone, :token, :order

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # deliveryモデルのバリデーション
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :city_address
    validates :telephone, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    item_order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(zip_code: zip_code, shipping_region_id: shipping_region_id, city: city, city_address: city_address,
                    building: building, telephone: telephone, order: order)
  end
end
