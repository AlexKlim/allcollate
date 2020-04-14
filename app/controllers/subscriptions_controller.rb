class SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.find_or_initialize_by(email: params[:subscription][:email])

    if subscription.save
      flash[:notice] = 'Thank you! We will notify you as soon as we start'
    else
      flash[:alert] = subscription.errors.full_messages.join('.')
    end
    redirect_to root_path
  end
end