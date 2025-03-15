# spec/support/login_helpers.rb
module LoginHelpers
  def sign_in(user, options = {})
    password = options[:password] || user.password
    post user_session_path, params: { user: { email: user.email, password: password } }
  end

  # def login_user(user)
  #   @request.env["devise.mapping"] = Devise.mappings[:user]
  #   sign_in user
  # end

  # def set_user_logged_in
  #   before(:each) do
  #     user = create(:user)
  #     login_admin(user)
  #     user
  #   end
  # end
end
