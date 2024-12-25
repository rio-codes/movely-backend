class Property < ApplicationRecord
    belongs_to :user
    has_many :property_ratings
    has_many :property_images
    validates :address, presence: true
  end