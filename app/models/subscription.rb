class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions

  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :frequency, presence: true
end