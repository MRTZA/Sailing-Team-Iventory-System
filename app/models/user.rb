class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true
  validates :permission, :inclusion => { :in => 0..1 }

  before_save :default_values

  def default_values
    self.permission = 0 if self.permission.nil?
  end
end
