class Item < ApplicationRecord

  
  has_one :buyer
  belongs_to :user
end