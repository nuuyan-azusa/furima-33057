class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_by_day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :state

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price,               numericality: { only_integer: true, message: "Half-width number" }
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
    validates :category_id,         numericality: { other_than: 0, message: "Select" }
    validates :state_id,            numericality: { other_than: 0, message: "Select" }
    validates :delivery_fee_id,     numericality: { other_than: 0, message: "Select" }
    validates :prefecture_id,       numericality: { other_than: 0, message: "Select" }
    validates :delivery_by_day_id,  numericality: { other_than: 0, message: "Select" }
end
