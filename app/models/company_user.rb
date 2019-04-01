# == Schema Information
#
# Table name: company_users
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  company_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CompanyUser < ApplicationRecord
  belongs_to :user
  belongs_to :company
end
