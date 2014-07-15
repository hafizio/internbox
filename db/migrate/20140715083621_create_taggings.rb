class CreateTaggings < ActiveRecord::Migration
  def change
    change_table :taggings do |t|

      t.timestamps
    end
  end
end
