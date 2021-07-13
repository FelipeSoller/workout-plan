require 'rails_helper'

RSpec.describe "Sign out", type: :feature do    
    let(:user_teacher) { create :user, :confirmed}

    xit 'with correct credentials' do
      sign_in_with(email: user_teacher.email, password: user_teacher.password)
      expect(page).to have_content('Signed in successfully.')
      click_on('Sign Out')
    end
  end  