require 'rails_helper'

RSpec.describe "Authentication", type: :feature, js:true do
  context "when user is confirmed" do  
    let(:user_teacher) { create :user, :confirmed }

    scenario 'with incorrect credentials' do
      sign_in_with(email: user_teacher.email, password: '123123123')
      expect(page).to have_content('Invalid Email or password.')            
      expect(page).to have_current_path(new_user_session_path)
    end

    scenario "forgot password" do   
      visit(root_path)
      find('#teacher-sign-in').click
      click_on('Forgot your password?')
  
      fill_in('Email', with: user_teacher.email)
  
      click_on('Send me reset password instructions')
            
      expect(page).to have_content('You will receive an email with instructions on how to reset your password in a few minutes.')
    end  
  end  

  context "when user isn't confirmed" do  
    let(:user_teacher) { create :user } 

    scenario "resend confirmation instructions" do   
      visit(root_path)
      find('#student-sign-in').click
      click_on("Didn't receive confirmation instructions?")

      fill_in('Email', with: user_teacher.email)

      click_on('Resend confirmation instructions')
            
      expect(page).to have_content('You will receive an email with instructions for how to confirm your email address in a few minutes.')
    end  
  end 
end
 

