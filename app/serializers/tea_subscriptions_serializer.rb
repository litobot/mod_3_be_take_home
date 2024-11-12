class TeaSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :tea_title, :subscription_frequency, :customer_name, :subscription_status

  attribute :tea_title do |tea_subscription|
    tea_subscription.tea.title
  end

  attribute :subscription_title do |tea_subscription|
    tea_subscription.subscription.frequency
  end

  attribute :customer_name do |tea_subscription|
    "#{tea_subscription.subscription.customer.first_name} + #{tea_subscription.subscription.customer.last_name}"
  end

  attribute :subscription_status do |tea_subscription|
    tea_subscription.status
  end
end