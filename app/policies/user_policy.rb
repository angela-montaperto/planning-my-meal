class UserPolicy < ApplicationPolicy
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
    index?
  end

  def update?
    index?
  end

  def destroy?
   index?
  end

  def edit?
    index?
  end
end