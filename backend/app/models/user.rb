class User < ApplicationRecord
  has_and_belongs_to_many :events, dependent: :destroy
  has_and_belongs_to_many :users
end
