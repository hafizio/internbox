class AddIndexToUserIdInProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.index(:user_id)
    end
  end
end
