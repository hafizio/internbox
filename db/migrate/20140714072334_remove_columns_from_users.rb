class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove(:report_card, :skill_level)
    end
  end
end
