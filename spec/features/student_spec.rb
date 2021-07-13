require 'rails_helper'

RSpec.describe Student, type: :feature, js:true do
  let(:user_student) { create :user, :student, :confirmed }
  let!(:student) { create :student }

  before do
    sign_in_with(email: user_student.email, password: user_student.password)
    expect(page).to have_content('Signed in successfully.')   
  end

  scenario "Teacher registers a new valid student" do
    visit(root_path)    

    click_on('See Training')
    expect(page).to have_link('Back')
  end  
end