class Tea < ApplicationRecord
  has_many :tea_subscriptions
  has_many :subscriptions, through: :tea_subscriptions

  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, numericality: { greater_than: 0 }
  validates :brew_time, numericality: { greater_than: 0 }
end