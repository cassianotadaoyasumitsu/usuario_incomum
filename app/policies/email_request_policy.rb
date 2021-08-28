class EmailRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true  # Anyone can view a restaurant
  end

end
