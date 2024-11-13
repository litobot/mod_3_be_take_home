class Api::V1::SubscriptionsController < ApplicationController
  def show
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription)
  end

  def update
    subscription = Subscription.find(params[:id])

    if subscription.update(status_params)
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: { error: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def status_params
    params.require(:subscription).permit(:status)
  end
end