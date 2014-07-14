class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github_url
      t.string :mentor_role
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
