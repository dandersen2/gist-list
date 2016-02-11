class Group < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  has_many   :snippets

  validates  :creator, presence: true
  validates  :name, presence: true

  delegate :username, to: :creator, prefix:true

  def editable_by? user
    creator == user
  end

  def reviewable_by? user
    creator != user
  end

end
