# frozen_string_literal: true

# item class
class Item < ActiveRecord::Base
  belongs_to :user
end
