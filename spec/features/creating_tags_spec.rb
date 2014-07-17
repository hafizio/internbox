require 'rails_helper'

feature 'Creating Tags' do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user.id,
                                               all_tags: 'rails, app') }
  before do
    sign_in_as!(user)
    user.projects.create { project }
    visit '/'
    click_link "#{project.name}"
  end

  scenario 'creating a tag' do
    click_button 'Edit'
    fill_in 'Tags (separate by comma)', with: 'example, rails, tag'
    click_button 'Update Project'
    within(".tags") do
      expect(page).to have_content('example, rails, tag')
    end
  end

  scenario 'clicking a tag redirect user to collection of projects tagged with the tag' do
    within(".tags") do
      click_link 'rails'
    end
    expect(page.current_url).to eq(tag_url('rails'))
  end
end
