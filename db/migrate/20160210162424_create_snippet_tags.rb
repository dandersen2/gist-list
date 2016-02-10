class CreateSnippetTags < ActiveRecord::Migration
  def change
    create_table :snippet_tags do |t|
      t.integer  :snippet_id, null: false
      t.integer  :tag_id, null: false

      t.timestamps null: false
    end
  end
end
