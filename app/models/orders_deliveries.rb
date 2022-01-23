class OrdersDeliveries

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :delivery_area_id, :city, :street, :building, :postal_code, :telephone_number

  with_options presence: true do
    validates :token
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :street
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create!(postal_code: postal_code, city: city, street: street, building: building, telephone_number: telephone_number, delivery_area_id: delivery_area_id, order_id: order.id)
  end
end