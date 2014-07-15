class AddJoinTableTaggings < ActiveRecord::Migration
  def change
    create_table :taggings, id: false do |t|
      t.integer(:tag_id)
      t.integer(:project_id)
      t.index([:tag_id, :project_id])
    end
  end
end
