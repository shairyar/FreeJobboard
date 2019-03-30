class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  
  has_many :company_users
  has_many :companies, through: :company_users
  
  accepts_nested_attributes_for :companies

  def is_job_seeker?
    self.companies.count == 0 ? true : false
  end

  def is_employer?
    self.companies.count == 0 ? false : true
  end
end
