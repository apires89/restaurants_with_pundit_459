class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    #when we call authorize @restaurant it becomes a "record"
    #record.user --> user that created the restaurant
    #user --> current_user // user logged in
    record.user == user || user.admin == "true"
  end

  def destroy?
    record.user == user || user.admin == "true"
  end
end
