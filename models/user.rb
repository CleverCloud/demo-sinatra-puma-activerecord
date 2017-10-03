# frozen_string_literal: true

class User < ActiveRecord::Base
  validates_uniqueness_of :name
end
