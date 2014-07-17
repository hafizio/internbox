require 'rails_helper'

feature 'Creating Projects' do
  before do
    sign_in_as!(FactoryGirl.create(:user))
    visit '/'
    click_link 'New Project'
  end

  scenario 'creating a project' do
    fill_in 'Project Name', with: 'Internbox'
    fill_in 'Github', with: 'https://github.com/ibnukamy/internbox'
    select('Intermediate', from: 'Project Level')
    select('Pair Programmer', from: 'Mentor Role')
    fill_in 'Tags', with: 'management, training, internship'
    fill_in 'Description', with: 'Application to enchance interns education perfomance'
    click_button 'Create Project'

    expect(page).to have_content('Project was successfully created.')
    project = Project.where(name: 'Internbox').first
    expect(page.current_url).to eql(project_url(project))
  end
end
