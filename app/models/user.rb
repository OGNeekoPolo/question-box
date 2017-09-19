# require 'bcrypt'
class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
