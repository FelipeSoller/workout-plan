require 'rails_helper'

RSpec.describe "Authentication", type: :feature, js:true do
  context "when user is confirmed" do  
    let(:user_teacher) { create :user, :confirmed } 

    scenario 'with correct credentials' do
      sign_in_with(email: user_teacher.email, password: user_teacher.password)
            
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Bem Vindo ao WorkoutPlan') 
    end    
  end 
end
 

