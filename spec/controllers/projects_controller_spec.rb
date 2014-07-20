require 'rails_helper'

describe ProjectsController do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:other_user) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user.id) }
  let(:other_project) { FactoryGirl.create(:project, name: 'Rails 5',
                                                     user_id: other_user.id) }

  context 'standard user' do
    before do
      sign_in(user)
    end

    it 'can edit his own project' do
      get :edit
      expect(page.url).to eq(edit_project_path(project))
    end

    it 'cannot edit others project'
    it 'can destroy his own project'
    it 'cannot delete others project'
  end

  context 'admin' do
    before do
      sign_in(admin)
    end

    it 'can edit all projects'
    it 'can delete all projects'
  end
end
