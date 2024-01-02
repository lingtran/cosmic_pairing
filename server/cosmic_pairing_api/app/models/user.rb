class User < ApplicationRecord
  validates :username, presence: true, allow_nil: false, allow_blank: false
  validates_uniqueness_of :username, case_sensitive: true
  validates :first_name, presence: true, allow_nil: false, allow_blank: false
end
