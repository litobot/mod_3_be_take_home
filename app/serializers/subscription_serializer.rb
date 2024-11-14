class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_details, :teas, :subscription_frequency, :subscription_status

  attribute :customer_details do |subscription|
    {
      first_name: subscription.customer.first_name,
      last_name: subscription.customer.last_name,
      email: subscription.customer.email
    }
  end

  attribute :teas do |subscription|
    subscription.teas.map do |tea|
      {
        title: tea.title,
        price: subscription.price
      }
    end
  end

  attribute :subscription_frequency do |subscription|
    subscription.frequency
  end

  attribute :subscription_status do |subscription|
    subscription.status
  end
end