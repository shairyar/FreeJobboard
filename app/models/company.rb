# == Schema Information
#
# Table name: companies
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  has_many :jobs
  accepts_nested_attributes_for :jobs

  validates :name, presence: true
end
