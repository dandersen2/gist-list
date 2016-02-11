class Tag < ActiveRecord::Base

  belongs_to :tag

  validates  :name, presence: true

end
