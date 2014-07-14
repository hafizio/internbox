class AddProjectLevelToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.string(:project_level)
    end
  end
end
