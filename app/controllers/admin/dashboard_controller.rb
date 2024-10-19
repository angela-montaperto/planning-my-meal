class Admin::DashboardController < AdminController
  before_action :skip_policy_scope
  before_action :skip_authorization
  def index

  end


end