class Event < ApplicationRecord
  has_and_belongs_to_many :user, required: true
  #validates_presence_of :name
end
