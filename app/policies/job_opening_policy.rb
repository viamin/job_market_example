# frozen_string_literal: true

class JobOpeningPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    employer?
  end

  def update?
    employer?
  end

  def destroy?
    employer?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
