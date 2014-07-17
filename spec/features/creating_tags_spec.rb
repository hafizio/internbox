require 'rails_helper'

feature 'Creating Tags' do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user.id) }
  before do
    sign_in_as!(user)
    user.projects.create { project }
    visit '/'
    click_link "#{project.name}"
    click_button 'Edit'
  end

  scenario 'creating a tag' do
    fill_in 'Tags (separate by comma)', with: 'example, rails, tag'
    click_button 'Update Project'
    expect(page).to have_content('example, rails, tag')
  end
end
