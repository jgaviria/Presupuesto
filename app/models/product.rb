class Product < ActiveRecord::Base

  has_many :credit_cards
  accepts_nested_attributes_for :credit_cards

end
