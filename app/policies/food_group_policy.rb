class FoodGroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        scope
      else
        scope.none
      end
    end
  end

  def index?
    @user.admin?
  end

  def new?
    index?
  end

  def create?
    new?
  end

  def edit?
    index?
  end

  def update?
    edit?
  end

  def destroy?
    index?
  end
end
