# == Schema Information
#
# Table name: jobs
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  company_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ApplicationRecord
  belongs_to :company

  has_many :job_skills
  has_many :skills, through: :job_skills

  accepts_nested_attributes_for :skills

  FULL_TIME = 'full_time'
  PART_TIME = 'part_time'
  TEMPORARY = 'temporary'
  FREELANCE = 'freelance'

  DISPLAY_WORK_TYPES = {
      FULL_TIME => 'Full Time',
      PART_TIME => 'Part Time',
      TEMPORARY => 'Temporary',
      FREELANCE => 'Freelance'
  }.freeze
end
