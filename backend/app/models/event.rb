class Event < ApplicationRecord
  belongs_to :user, required: true
  #validates_presence_of :name
end
