class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  paginates_per 3
  attr_accessor :title, :body
  include PgSearch
  multisearchable :against => [:title, :body]
end
