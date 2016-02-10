class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer  :creator_id, null: false
      t.string   :name, null: false
      t.string   :language
      t.string   :description

      t.timestamps null: false
    end
  end
end
