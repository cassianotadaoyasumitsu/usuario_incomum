class SharePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    def create?
      true  # Anyone can create
    end
end
