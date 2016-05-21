class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, presence: true
  validates :name, presence: true
  validates :user, presence: true
  validates :email, uniqueness: true
  validates :user, uniqueness: true
end
