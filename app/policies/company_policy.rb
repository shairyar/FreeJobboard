class CompanyPolicy < ApplicationPolicy
  def index?
    authorized?
  end

  def create?
    authorized?
  end

  def show?
    authorized?
  end

  def edit?
    authorized?
  end

  def update?
    edit?
  end

  private
  def authorized?
    user.companies.include?(record)
  end
end