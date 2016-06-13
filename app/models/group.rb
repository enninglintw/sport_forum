class Group < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates_presence_of :name
  validates_uniqueness_of :name
end
