require 'rails_helper'

RSpec.describe Training, type: :feature, js:true do
  let(:user_teacher) { create :user, :confirmed } 

  let(:teacher) { user_teacher.teacher }
  let!(:student) { create :student, teacher: teacher }
  let!(:training) { create :training, student: student }
  let!(:exercise) { create :exercise, training: training }

  before do
    sign_in_with(email: user_teacher.email, password: user_teacher.password)
    expect(page).to have_content('Signed in successfully.')   
  end

  scenario 'Show trainings list' do
    visit(students_path)
    expect(page).to have_content(student.name)

    click_on(student.name)
    expect(page).to have_content(student.name)    
    expect(page).to have_content('Students')    
    expect(page).to have_link('See Training')    
    expect(page).to have_link('Edit')    
    expect(page).to have_content('Trainings')    
  end 

  scenario 'Edit and update student' do
    new_name = Faker::Name.name

    visit(students_path)
    click_on('Edit')

    fill_in('Name', with: new_name)
    click_on('Update Student')

    expect(page).to have_content('Student was successfully updated.') 
  end

  scenario 'Creating trainings and exercises' do
    visit(students_path)
    expect(page).to have_content(student.name)

    click_on(student.name)
    click_on('New Training')    
    
    fill_in('Title', with: training.title)
    fill_in('Name', with: exercise.name)
    fill_in('Sets', with: exercise.sets)
    fill_in('Reps', with: exercise.reps)
    fill_in('Rest', with: exercise.rest)
    select(exercise.muscle_group, :from => 'Muscle group')

    click_on('Create Training')    

    expect(page).to have_content('Training was successfully created.')     
  end 

  scenario 'Editing trainings and exercises' do
    visit(students_path)

    click_on(student.name)
    click_on('New Training')    
    
    fill_in('Title', with: training.title)
    fill_in('Name', with: exercise.name)
    fill_in('Sets', with: exercise.sets)
    fill_in('Reps', with: exercise.reps)
    fill_in('Rest', with: exercise.rest)
    select(exercise.muscle_group, :from => 'Muscle group')

    click_on('Create Training')    

    expect(page).to have_content('Training was successfully created.')    
    find(:xpath, "/html/body/div[@class='container']/div[@class='card text-dark bg-light mb-3 mx-auto'][2]/div[@class='card-body']/table[@class='table']/tbody/tr[1]/td[@class='d-flex justify-content-end']/a[@class='btn btn-primary btn btn-sm ms-3']").click    

    new_title = 'Treino atualizado'
    new_name = Faker::Lorem.word 
    new_sets = 5
    new_reps = 10
    new_rest = 45

    fill_in('Title', with: new_title)
    fill_in('Name', with: new_name)
    fill_in('Sets', with: new_sets)
    fill_in('Reps', with: new_reps)
    fill_in('Rest', with: new_rest)

    click_on('Update Training')

    expect(page).to have_content('Training was successfully updated.')  
  end

  scenario 'Delete training', js: true do
      visit(students_path)
      click_on(student.name)

      find(:xpath, "/html/body/div[@class='container']/div[@class='card text-dark bg-light mb-3 mx-auto'][2]/div[@class='card-body']/table[@class='table']/tbody/tr/td[@class='d-flex justify-content-end']/a[@class='btn btn-danger btn-sm ms-3']").click 
      1.second
      page.driver.browser.switch_to.alert.accept
      
      expect(page).to have_content('Training was successfully destroyed.')
  end

  scenario 'Delete exercise', js: true do
    visit(students_path)
    click_on(student.name)
    click_on(training.title)

    find(:xpath, "/html/body/div[@class='container']/div[@class='card text-dark bg-light mb-3 mx-auto']/div[@class='card-body']/table[@class='table']/tbody/tr/td[@class='d-flex justify-content-end']/a[@class='btn btn-danger btn-sm ms-3']").click 
    1.second
    page.driver.browser.switch_to.alert.accept
    
    expect(page).to have_content('Exercise was successfully destroyed.')
end

  scenario 'See trainings and exercises' do
    visit(students_path)
    expect(page).to have_content(student.name)

    click_on(student.name)
    click_on('See Training')        
    
    expect(page).to have_content(training.title)    
    expect(page).to have_content(exercise.name)   
    expect(page).to have_link('Back')       
  end 
end