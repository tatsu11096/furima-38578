class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :zip_code          , null:false
      t.integer    :shipping_region_id, null:false
      t.string     :city              , null:false
      t.string     :city_address      , null:false
      t.string     :building            
      t.string     :telephone         , null:false
      t.references :order             , null:false, foreign_key: true
   
      t.timestamps
    end
  end
end
