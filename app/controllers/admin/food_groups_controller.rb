class Admin::FoodGroupsController < AdminController
  before_action :set_food_group, only: [:edit, :update, :destroy]
  def index
    authorize FoodGroup
    @q = policy_scope(FoodGroup).ransack(params[:q])
    @food_groups = @q.result.page(params[:page] || 1).per(20)
  end

  def new
    @food_group = policy_scope(FoodGroup).new()
    authorize @food_group
  end

  def create
    @food_group = policy_scope(FoodGroup).new(food_group_params)
    authorize @food_group
    if @food_group.save
      redirect_to admin_food_groups_path, success: t('labels.record_created')
    else
      render :new,  danger: "Impossibile creare il record: #{@food_group  .errors.full_messages}", status: :unprocessable_entity
    end
  end

  def edit
    authorize @food_group
  end

  def update
    authorize @food_group
    if @food_group.update(food_group_params)
      redirect_to admin_food_groups_path, success: t('labels.record_modified')
    else
      render :edit, danger: "Impossibile modificare il record: #{@food_group.errors.full_messages}", status: :unprocessable_entity
    end
  end

  def destroy
    authorize @food_group
    if @food_group.destroy
      redirect_to admin_food_groups_path, success: t('labels.record_destroyed'), status: :see_other
    else
      redirect_to admin_food_groups_path, danger: "Impossibile rimuovere il record: #{@food_group.errors.full_messages}", status: :unprocessable_entity
    end
  end

  protected

  def set_food_group
    @food_group = policy_scope(FoodGroup).find(params[:id])
  end

  def food_group_params
   params.require(:food_group).permit(:group_name, :name, :code)
  end
end
