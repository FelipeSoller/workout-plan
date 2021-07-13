require 'rails_helper'

RSpec.describe Teacher, type: :feature, js:true do
  let(:user_teacher) { create :user, :confirmed }  
  let(:teacher) { user_teacher.teacher }

  let!(:student) { create :student, teacher: teacher }

  before do
    sign_in_with(email: user_teacher.email, password: user_teacher.password)
    expect(page).to have_content('Signed in successfully.')   
  end

  scenario "Teacher registers a new valid student" do
    visit(students_path)    

    click_on('New Student')

    fill_in('Name', with: Faker::Name.name[0..20])
    fill_in('Email', with: Faker::Internet.email)

    click_on('Create Student')

    expect(page).to have_content('Student was successfully created.')
  end

  scenario "Teacher registers an ivalid student without email" do
    visit(students_path)    

    click_on('New Student')

    fill_in('Name', with: Faker::Name.name[0..20])
    fill_in('Email', with: '')

    click_on('Create Student')

    expect(page).to have_content("User email can't be blank")
  end

  scenario "Teacher registers with an invalid email" do
    visit(students_path)    

    click_on('New Student')

    fill_in('Name', with: Faker::Name.name[0..20])
    fill_in('Email', with: Faker::Lorem.word)

    click_on('Create Student')

    expect(page).to have_content("User email is invalid")
  end

  scenario "Teacher registers an ivalid student without name" do
    visit(students_path)    

    click_on('New Student')

    fill_in('Name', with: '')
    fill_in('Email', with: Faker::Internet.email)

    click_on('Create Student')

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Name is too short (minimum is 2 characters)")
  end

  scenario 'Show students' do
    visit(students_path)
    expect(page).to have_content(student.name)

    click_on(student.name)
    expect(page).to have_content(student.name)    
  end
 
  scenario 'Edit and update student' do
    new_name = Faker::Name.name

    visit(students_path)
    click_on('Edit')

    fill_in('Name', with: new_name)
    click_on('Update Student')

    expect(page).to have_content('Student was successfully updated.') 
    expect(page).to have_content(new_name) 
  end

  scenario 'Delete student', js: true do
    visit(students_path)
    click_on('Destroy')
    1.second
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Student was successfully destroyed.')
  end
end