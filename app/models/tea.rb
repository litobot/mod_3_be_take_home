class Tea < ApplicationRecord
  has_many :tea_subscriptions
  has_many :subscriptions, through: :tea_subscriptions

  validates :title, :description, presence: true
  validates :temperature, :brew_time, numericality: { greater_than: 0 }
end