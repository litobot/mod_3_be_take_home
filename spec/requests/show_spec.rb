require "rails_helper"

RSpec.describe "Show Action" do
  describe "GET /api/v1/subscriptions/:id" do
    before do
      @customer_1 = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Main St")
      @customer_2 = Customer.create!(first_name: "Jane", last_name: "Smith", email: "jane.smith@example.com", address: "456 Elm St")
      @customer_3 = Customer.create!(first_name: "Alice", last_name: "Johnson", email: "alice.johnson@example.com", address: "789 Oak St")

      @subscription_1 = Subscription.create!(title: "Monthly Plan", price: 20.0, status: "Active", frequency: "Monthly", customer_id: @customer_1.id)
      @subscription_2 = Subscription.create!(title: "Weekly Plan", price: 15.0, status: "Active", frequency: "Weekly", customer_id: @customer_2.id)
      @subscription_3 = Subscription.create!(title: "Annual Plan", price: 180.0, status: "Active", frequency: "Annual", customer_id: @customer_3.id)

      @tea_1 = Tea.create!(title: "Green Tea", description: "A refreshing blend", temperature: 80, brew_time: 3.5)
      @tea_2 = Tea.create!(title: "Black Tea", description: "A bold and strong flavor", temperature: 90, brew_time: 4.0)
      @tea_3 = Tea.create!(title: "Herbal Tea", description: "A calming, caffeine-free blend", temperature: 85, brew_time: 5.0)

      @tea_subscription_1 = TeaSubscription.create!(tea_id: @tea_1.id, subscription_id: @subscription_1.id)
      @tea_subscription_2 = TeaSubscription.create!(tea_id: @tea_2.id, subscription_id: @subscription_2.id)
      @tea_subscription_3 = TeaSubscription.create!(tea_id: @tea_3.id, subscription_id: @subscription_3.id)
    end

    context "Happy Path" do
      it "returns the correct subscription details" do
        get "/api/v1/subscriptions/#{@subscription_1.id}"
      
        expect(response).to have_http_status(:success)
      
        subs = JSON.parse(response.body)
      
        expect(subs).to have_key('data')
        expect(subs['data']).to be_a(Hash)
      
        attributes = subs['data']['attributes']
        expect(attributes).to have_key('customer_details')
        expect(attributes).to have_key('teas')
        expect(attributes).to have_key('subscription_frequency')
        expect(attributes).to have_key('subscription_status')
      
        expect(attributes['customer_details']).to eq({
          "first_name" => "John",
          "last_name" => "Doe",
          "email" => "john.doe@example.com"
        })
      
        expect(attributes['teas']).to eq([
          { "title" => "Green Tea", "price" => 20.0 }
        ])
      
        expect(attributes['subscription_frequency']).to eq('Monthly')
        expect(attributes['subscription_status']).to eq('Active')
      end
      
    end

    context "Sad Path" do
      it "returns an error if the subscription does not exist" do
        get "/api/v1/subscriptions/9999"
  
        json = JSON.parse(response.body)
  
        expect(response).to have_http_status(:not_found)
        expect(json).to have_key('error')
        expect(json['error']).to eq("Subscription not found")
      end
    end
  end
end
