class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :user,                null: false, foreign_key: true
      t.integer    :delivery_area_id,    null: false
      t.string     :city,                null: false
      t.string     :street,              null: false
      t.string     :building
      t.string     :postal_code,         null: false
      t.string     :telephone_number,    null: false
    end
  end
end
