class Api::V1::SubscriptionsController < ApplicationController
  def show
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription)
  end

  def update
    updated_status = Subscription.update(params[:id], status_params)
    render json: SubscriptionSerializer.new(updated_status)
  end

  private

  def status_params
    params.require(:subscription).permit(:status)
  end
end