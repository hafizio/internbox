class AddIndexToMentorIdInUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.index(:mentor_id)
    end
  end
end
