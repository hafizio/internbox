require 'rails_helper'

feature 'Deleting projects' do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user.id) }

  before do
    sign_in_as!(user)
    user.projects.create { project }
  end

  scenario 'deleting a project' do
    visit '/'
    click_link "#{project.name}"
    click_link 'Destroy'

    expect(page).to have_content('Project was successfully destroyed.')

    visit '/'

    expect(page).to have_no_content(project.name)
  end
end
