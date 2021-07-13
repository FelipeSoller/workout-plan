require 'rails_helper'

RSpec.describe 'sign_up', type: :feature do
    scenario 'creates account' do
        visit '/'
        click_on 'Sign Up'

        fill_in 'Name', with: 'John Doe'
        fill_in 'Email', with: 'johndoe@example.com'
        fill_in 'Password', with: '123123123'
        fill_in 'Password confirmation', with: '123123123'

        click_on 'Create Teacher'

        expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
end