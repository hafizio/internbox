require 'rails_helper'

feature 'Deleting projects' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as!(user)
  end

  scenario 'Deleting a project' do
    pending
    user.projects.create { FactoryGirl.create(:project, name: 'Internbox') }

    visit '/'
    click_link 'Details'
    click_button 'Destroy'

    expect(page).to have_content('Project was successfully destroyed.')

    visit '/'

    expect(page).to have_no_content(project.name)
  end
end
