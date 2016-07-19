class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
