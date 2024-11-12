require "rails_helper"

RSpec.describe "Index Action" do
  describe "GET /api/v1/tea_subscriptions" do
    before do
      customer = Customer.create!(
        first_name: "John",
        last_name: "Doe",
        email: "john.doe@example.com",
        address: "123 Main St"
      )

      subscription = Subscription.create!(
        title: "Monthly Plan",
        price: 20.0,
        status: "active",
        frequency: "monthly",
        customer_id: customer.id
      )

      tea = Tea.create!(
        title: "Green Tea",
        description: "A refreshing blend",
        temperature: 80,
        brew_time: 3.5
      )

      TeaSubscription.create!(
        tea_id: tea.id,
        subscription_id: subscription.id
      )
    end

    it "returns all tea subscriptions" do
      get '/api/v1/tea_subscriptions'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data'].size).to eq(1)
    end
  end
end
