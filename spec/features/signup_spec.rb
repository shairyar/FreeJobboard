require 'rails_helper'

RSpec.feature 'Signups', type: :feature do
  scenario 'Job Seeker' do
    visit new_user_registration_path
    expect(page).to have_no_field('user[companies_attributes][0][name]')
  end

  scenario 'Employer' do
    visit users_sign_up_employer_path
    expect(page).to have_field('user[companies_attributes][0][name]')
  end
end