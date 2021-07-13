require 'rails_helper'

feature 'Home', type: :feature do
    scenario "show welcome message" do
      visit(root_path)
      expect(page).to have_content('Bem Vindo ao WorkoutPlan') 
    end
  
    scenario 'has sign up link' do
      visit(root_path)
      expect(page).to have_link('Sign Up')
    end

    scenario 'has sign in link' do
      visit(root_path)
      expect(page).to have_link('Sign In')
    end
  end