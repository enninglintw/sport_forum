class Group < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user
  has_many :group_users, dependent: :destroy
  has_many :members, through: :group_users, source: :user

  validates_presence_of :name
  validates_uniqueness_of :name
end
