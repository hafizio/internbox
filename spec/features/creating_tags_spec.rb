require 'rails_helper'

feature 'Creating Tags' do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user.id,
                                               all_tags: '') }
  before do
    sign_in_as!(user)
    user.projects.create { project }
    visit '/'
    click_link "#{project.name}"
    click_link 'Edit'
    fill_in 'Tags (separate by comma)', with: 'example, rails, tag'
    click_button 'Update Project'
  end

  scenario 'creating tags' do
    within(".tags") do
      expect(page).to have_content('example, rails, tag')
    end
  end

  scenario 'clicking a tag redirect user to the collection of projects tagged with the tag' do
    within(".tags") do
      click_link 'rails'
    end
    expect(page.current_url).to eq(tag_url('rails'))
  end
end
