require "rails_helper"

RSpec.describe "Update Action" do
  describe "PATCH /api/v1/subscriptions/:id" do
    before do
      @customer_1 = Customer.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Main St")

      @subscription_1 = Subscription.create!(title: "Monthly Plan", price: 20.0, status: "active", frequency: "monthly", customer_id: @customer_1.id)
    end

    context "Happy Path" do
      it "can update the subscription status to 'cancelled' " do
        previous_status = @subscription_1.status
        status_params = { subscription: { status: "cancelled" } }

        headers = { "CONTENT_TYPE" => "application/json" }

        patch "/api/v1/subscriptions/#{@subscription_1.id}", headers: headers, params: JSON.generate(status_params)

        json = JSON.parse(response.body)
        
        expect(response).to have_http_status(:success)

        expect(json['data']['attributes']['subscription_status']).to_not eq(previous_status)
        expect(json['data']['attributes']['subscription_status']).to eq('cancelled')
      end
    end

    context "Sad Path" do
      it "returns an error when attempting to update with invalid data" do
        invalid_params = { subscription: { status: nil } }
  
        headers = { "CONTENT_TYPE" => "application/json" }
  
        patch "/api/v1/subscriptions/#{@subscription_1.id}", headers: headers, params: JSON.generate(invalid_params)
  
        json = JSON.parse(response.body)
  
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['error']).to include("Status can't be blank")
      end
    end
  end
end