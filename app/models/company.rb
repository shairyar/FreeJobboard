class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  has_many :jobs
  accepts_nested_attributes_for :jobs

  validates :name, presence: true
end
