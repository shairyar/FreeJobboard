class JobPolicy < ApplicationPolicy
  def show?
    authorized?
  end

  def edit?
    authorized?
  end

  def update?
    edit?
  end

  def destroy?
    authorized?
  end

  private

  def authorized?
    user.company_ids.include?(record.company_id)
  end
end