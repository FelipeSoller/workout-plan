module LoginHelpers
    def sign_in_with(email:, password:)
      visit(new_user_session_path)
  
      fill_in('Email', with: email)
      fill_in('Password', with: password)
  
      click_on('Log in')
    end
  
    # def sign_out_with(name:)   
    #   click_on 'Sign Out'
    # end
end
  
RSpec.configure do |config|
  config.include LoginHelpers, type: :feature
end
  