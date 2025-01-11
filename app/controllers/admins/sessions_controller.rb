# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
def after_sign_in_path_for(resource)
    admins_top_path
end

  def destroy
    super
  end

end
