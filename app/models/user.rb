class User < ActiveRecord::Base
  has_secure_password

  has_many :groups, foreign_key: :creator_id
  has_many :snippets, through: :groups

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
