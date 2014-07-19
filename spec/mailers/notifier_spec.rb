require "rails_helper"

describe Notifier do
  describe 'new project' do
    let!(:admin) { FactoryGirl.create(:admin) }
    let!(:user) { FactoryGirl.create(:user, mentor_id: admin.id) }
    let!(:project) do
      Project.new(id: 1, name: 'Rails 4', user_id: user.id)
    end
    let!(:email) { Notifier.new_project(project) }

    it 'send email to mentor in charge when intern create new project' do
      expect(email.to).to include(admin.email)
      title = "[Internbox] New Project: #{project.name} by #{user.name}"
    end
  end
end
