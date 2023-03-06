class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_region
  belongs_to :shipping_date
  
 

  with_options presence: true do
    validates :item_name
    validates :image
    validates :price
    validates :explanation_text
    validates :category_id
    validates :state_id
    validates :delivery_charge_id
    validates :shipper_id
    validates :shipping_date_id
    end

  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                  numericality: { only_integer: true, message: 'Half-width number' }
  validates :price, 
             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' } 
  
  def was_attached?
    self.image.attached?
  end
end

