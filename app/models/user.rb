# frozen_string_literal: true

# user class
class User < ActiveRecord::Base
  has_secure_password
  has_many :items
end
