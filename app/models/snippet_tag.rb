class SnippetTag < ActiveRecord::Base

  belongs_to :snippet
  belongs_to :tag

  validates  :snippet_id, presence: true
  validates  :tag_id, presence: true

end
