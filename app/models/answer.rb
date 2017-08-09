class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  include PgSearch
  multisearchable :against => :body
end
