class Question < ApplicationRecord
  has_many :comments
  default_scope { order(created_at: :desc) }
  acts_as_votable

end
