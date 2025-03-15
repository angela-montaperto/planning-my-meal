class Users::PasswordsController < Devise::PasswordsController
  def update
    super
    unless current_user.nil?
      current_user.next_password_reminder = Settings.user.password_expiration_days.days.from_now.to_date
      current_user.save!
    end
  end
end
