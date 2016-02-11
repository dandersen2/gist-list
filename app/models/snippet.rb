class Snippet < ActiveRecord::Base

  belongs_to :group
  has_many :snippet_tags
  has_many :tags, through: :snippet_tags

  validates  :group_id, presence: true
  validates  :name, presence: true
  validates  :content, presence: true

  def editable_by? user
    self.group.creator == user
  end

  def reviewable_by? user
    self.group.creator != user
  end

end
