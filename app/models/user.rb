class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :albums
  validates :username, presence: true, uniqueness: true
  validates :password, length: {in:8..20}, presence: true

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      return user
    end
    return nil
  end
end
