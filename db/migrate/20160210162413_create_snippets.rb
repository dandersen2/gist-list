class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer  :group_id, null: false
      t.string   :name, null: false
      t.string   :content, null: false

      t.timestamps null: false
    end
  end
end
