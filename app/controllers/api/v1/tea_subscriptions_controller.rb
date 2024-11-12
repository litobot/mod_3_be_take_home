class Api::V1::TeaSubscriptionsController < ApplicationController
    
  def index
    tea_subscriptions = TeaSubscription.all
    # render json: 
  end
end