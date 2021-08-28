class KeepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
<<<<<<< HEAD
    def show?
      true  # Anyone can view
    end

    def create?
      true  # Anyone can create
    end
=======

  def show?
    true  # Anyone can view a restaurant
  end
>>>>>>> ad8d9dd (bundle update)

  def create?
    true  # Anyone can view a restaurant
  end

  def update?
    record.user == user  # Only restaurant creator can update it
  end

  def destroy?
    record.user == user  # Only restaurant creator can update it
  end

  def user_posted?
    true
  end
end
