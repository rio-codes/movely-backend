class User < ApplicationRecord
    has_many :properties
    validates :email, presence: true, uniqueness: true
    validates :encrypted_password, presence: true
  end