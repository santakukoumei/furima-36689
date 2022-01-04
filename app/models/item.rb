class Item < ApplicationRecord

  

  has_one_attached :image
  has_one :buyer
  belongs_to :user
  belongs_to :category
  belongs_to :detail
  belongs_to :burdened
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :item, presence: true, unless: :was_attached?
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :detail_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burdened_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  def was_attached?
    self.image.attached?
  end
end