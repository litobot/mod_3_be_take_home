class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions

  validates :title, :status, :frequency, presence: true
  validates :price, numericality: { greater_than: 0 }
end