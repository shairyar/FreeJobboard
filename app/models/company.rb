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
  has_one :address, as: :addressable
  validates :name, presence: true

  accepts_nested_attributes_for :jobs, :address, allow_destroy:true, update_only: true

  has_one_attached :logo
end
