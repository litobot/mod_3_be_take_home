class Api::V1::SubscriptionsController < ApplicationController
  def show
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription)
  end
end

