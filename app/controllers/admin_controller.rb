class AdminController < ApplicationController
  include Pundit::Authorization
  after_action :verify_authorized
  after_action :verify_policy_scoped
  
  before_action :set_referrer, only: [:index]
  before_action :role_authorize?, only: [:index]

  layout 'admin'

  protected

  def set_referrer
    session[:return_to] = request.url if request.format == :html
  end

  def get_referrer
    session[:return_to]
  end

  def pagination_parameters q, klass
    page = q[:page] || 1
    per_page = q[:per_page] || klass.default_per_page
    return page.to_i, per_page.to_i
  end

  private

  def role_authorize?
    if current_user.user?
      redirect_to root_path
    end
  end

end