# frozen_string_literal: true

# user class
class User < ActiveRecord::Base
  has_secure_password
  has_many :items
  validates :username, :email, presence: true, uniqueness: true
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
