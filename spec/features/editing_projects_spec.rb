require 'rails_helper'

feature 'Editing Projects' do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user.id) }

  before do
    sign_in_as!(user)
    user.projects.create { project }

    visit '/'
    click_link "#{project.name}"
    click_link 'Edit'
  end

  scenario 'updating a project' do
    fill_in 'Project Name', with: 'Rails 5'
    click_button 'Update Project'

    expect(page).to have_content('Project was successfully updated.')
  end
end
