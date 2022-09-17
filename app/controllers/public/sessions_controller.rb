# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    users_my_page_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
