# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  protected
  def after_confirmation_path_for(resource_name, resource)
    token = resource.send(:set_reset_password_token)
    edit_password_url(resource, reset_password_token: token)
  end

  def after_resending_confirmation_instructions_path_for(resource_name)
    admin_users_path
  end
end
