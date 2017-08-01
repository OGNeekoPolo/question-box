class Question < ApplicationRecord
  belongs_to :user
  has_many :asnwers
  paginates_per 5
end
