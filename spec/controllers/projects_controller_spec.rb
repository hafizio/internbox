require 'rails_helper'

describe ProjectsController do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:user_a) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:user_b) { FactoryGirl.create(:user, mentor_id: admin.id) }
  let(:project) { FactoryGirl.create(:project, name: 'Rails 4',
                                               user_id: user_a.id) }
  let(:other_project) { FactoryGirl.create(:project, name: 'Rails 5',
                                                     user_id: user_b.id) }

  context 'standard user' do
    before do
      sign_in(user_a)
    end

    it 'can edit his own project' do
      get :edit
      #expect(flash[:notice]).to eq('Project was successfully updated.')
      expect(page.url).to eq(edit_project_path(project))
    end

    it 'can destroy his own project' do
      get :destroy
      expect(flash[:alert]).to eq('Project was successfully destroyed.')
    end
  end

  context 'other user' do
    before do
      sign_in(user_b)
    end

    it 'cannot edit user_a project' do
      get :edit
      expect(flash[:alert]).to eq('You do not have enough permission to do this')
    end

    it 'cannot delete user_a project' do
      get :edit
      expect(flash[:alert]).to eq('You do not have enough permission to do this')
    end
  end

  context 'admin' do
    before do
      sign_in_admin
    end

    it 'can edit all projects' do
      get :edit
      expect(page.url).to eq(edit_project_path(project))
    end

    it 'can delete all projects' do
      get :destroy
      expect(flash[:alert]).to eq('Project was successfully destroyed.')
    end
  end
end
