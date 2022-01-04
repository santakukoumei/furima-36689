class Burdened < ActiveHash::Base
  self.data = [
    { id: 1, shipping: '___' },
    { id: 2, shipping: '着払い(購入者負担)' },
    { id: 3, shipping: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
  belongs_to :burdened

end
