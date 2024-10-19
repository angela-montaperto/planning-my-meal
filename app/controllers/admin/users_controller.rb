class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    authorize User
    @q = policy_scope(User).ransack(params[:q])
    @users = @q.result.page(params[:page] || 1).per(20)
  end

  def new
    @user = policy_scope(User).new(role: Role::USER, active: true)
    authorize @user
  end

  def edit
    authorize @user
  end

  def create
    @user = policy_scope(User).new(user_params)
    authorize @user
    @user.password = @user.password_confirmation = generate_password
    if @user.save
      redirect_to get_referrer || admin_users_path, success: t('labels.record_created')
    else
      render :new,  danger: "Impossibile creare il record: #{@user.errors.full_messages}", status: :unprocessable_entity
    end
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to get_referrer || admin_users_path, success: t('labels.record_modified')
    else
      render :edit,  danger: "Impossibile modificare il record: #{@user.errors.full_messages}", status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user

    if @user.destroy
      redirect_to get_referrer || admin_users_path, success: t('labels.record_destroyed'), status: :see_other
    else
      redirect_to get_referrer || admin_users_path, danger: "Impossibile rimuovere il record: #{@user.errors.full_messages}", status: :unprocessable_entity
    end
  end


  protected

  def set_user
    @user = policy_scope(User).find(params[:id])
  end

  def generate_password
    SecureRandom.hex
  end

  def user_params
   params.require(:user).permit(:active, :name, :surname, :email, :role)
  end

end
