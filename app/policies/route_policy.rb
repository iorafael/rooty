class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def home?
    record.user == user
  end

  def edit?
    record.user == user
  end

end
