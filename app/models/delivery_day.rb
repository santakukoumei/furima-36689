class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, day: '___' },
    { id: 2, day: '1~2日で発送' },
    { id: 3, day: '2~3日で発送' },
    { id: 4, day: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items

end