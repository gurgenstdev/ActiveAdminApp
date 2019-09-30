class HomesController < ApplicationController
  def index
    @user = current_user.inspect
    puts "__________________"
  end
end
