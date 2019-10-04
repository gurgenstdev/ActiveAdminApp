class AggregatesController < ApplicationController
  def index
    @user = current_user
    @network = current_user.networks.all
  end

  def dashboard
    if user_signed_in?
      network = current_user.primary_network
      redirect_to network_aggregates_path(network.name)
    end
  end
end